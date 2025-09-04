class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @locations = Location.includes(:amenities)
    @locations = @locations.search(params[:search]) if params[:search].present?

    if params[:amenities].present?
      selected_amenities = params[:amenities]
      # Do not touch
      @locations = @locations.where(
        id: Location.joins(:amenities)
        .where(amenities: {key: selected_amenities })
        .group("locations.id")
        .having("COUNT(DISTINCT amenities.id) = ?", selected_amenities.size)
      )
    end

    lat = current_user&.latitude || params[:lat]
    lng = current_user&.longitude || params[:lng]
    radius = params[:radius] || 5

    @user_lat = lat
    @user_lng = lng

    @locations = @locations.search(params[:q]) if params[:q].present?
    @locations = @locations.nearby(lat, lng, radius) if lat.present? && lng.present?
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
    @back_url = params[:back_to]

    lat = current_user&.latitude || params[:lat]
    lng = current_user&.longitude || params[:lng]
    @user_lat = lat
    @user_lng = lng
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.owner = current_user
    if @location.save
      params["amenities"].each do |name|
        LocationAmenity.create(location: @location, amenity: Amenity.find_by(key: name))
      end
      redirect_to location_path(@location)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

  def favorite
    @location = Location.find(params[:id])
    current_user.favorite(@location)
    redirect_back(fallback_location: location_path(@location))
  end

  def unfavorite
    @location = Location.find(params[:id])
    current_user.unfavorite(@location)
    redirect_back(fallback_location: @location)
  end

  def get_coords
    @location = Location.new
    if location_params[:photos].present?
      first_photo = location_params[:photos].find { |el| el.class != String }
      metadata = Exiftool.new(first_photo.tempfile.path)
      @location.lat = metadata.to_hash[:gps_latitude]
      @location.lng = metadata.to_hash[:gps_longitude]
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :category, :address, :city, :prefecture, :postal_code, :website, :phone, :lat, :lng, photos: [])
  end
end

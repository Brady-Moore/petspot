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
  end

  def show
    @location = Location.find(params[:id])
    @review = Review.new
    @back_url = params[:back_to]
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

  private

  def location_params
    params.require(:location).permit(:name, :category, :address, :city, :prefecture, :postal_code, :website, :phone, photos: [])
  end
end

class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    if params[:query].present?
      @locations = Location.search(params[:query])
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.owner = current_user
    if @location.save
      redirect_to location_path(@location)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def location_params
    params.require(:location).permit(:name, :category, :address, :city, :prefecture, :postal_code, :website, :phone, photos: [])
  end


end

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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

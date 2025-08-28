class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorited_by_type("Location") || []
  end

  def create
    # @location = Location.find(params[:id])
    # current_user.favorite(@location)
    # @favorites = current_user.favorited_by_type("Location") || []
  end

  def destroy
    @location = Location.find(params[:id])
    current_user.unfavorite(@location)
    @favorites = current_user.favorited_by_type("Location") || []

    respond_to do |format|
      format.turbo_stream # renders destroy.turbo_stream.erb
      format.html { redirect_to favorites_path, notice: "#{@location.name} removed." }
    end
  end
end
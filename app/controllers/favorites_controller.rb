class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorited_by_type("Location")
  end
  
  def create
  end

  def destroy
  end
end

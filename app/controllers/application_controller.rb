class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_amenities

  def set_amenities
    @amenities = Amenity.all
    @groups = @amenities.in_groups(4, false)
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @amenities = Amenity.all
    @groups = @amenities.in_groups(4, false)
  end
end

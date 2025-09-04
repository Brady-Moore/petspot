class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @amenities = Amenity.all
    @groups = @amenities.in_groups(4, false)
    @locations = Location.all.sample(3)
    @popular = Location.first(4)
    @recent = Location.last(4)
  end
end

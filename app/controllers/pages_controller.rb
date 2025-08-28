class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @amenities = Amenity.all
    @first_half = @amenities[0..(@amenities.count/2)]
    @second_half = @amenities - @first_half
  end
end

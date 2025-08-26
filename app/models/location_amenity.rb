class LocationAmenity < ApplicationRecord
  belongs_to :location
  belongs_to :amenity
end

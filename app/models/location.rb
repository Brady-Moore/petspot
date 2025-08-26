class Location < ApplicationRecord
  belongs_to :owner, class_name: "User", optional: true
  has_many :location_amenities
  has_many :amenities, through: :location_amenities
end

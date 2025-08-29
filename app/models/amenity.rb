class Amenity < ApplicationRecord
  has_many :location_amenities
  has_many :locations, through: :location_amenities

  def icon_class
    case key.downcase
    when "water"
      "fas fa-faucet-drip"
    when "shades"
      "umbrella-icon"
    when "menu"
      "dog-food-icon"
    when "dog_run"
      "dog-run-icon"
    when "indoor"
      "dog-house-icon"
    when "trash"
      "fa-solid fa-trash"
    when "leash_station"
      "leashed-dog-icon"
    when "beds"
      "dog-bed-icon"
    when "warm"
      "heated-icon"
    when "cool"
      "cooled-icon"
    when "showers"
      "fa-solid fa-shower"
    when "strollers"
      "dog-stroller-icon"
    when "photos"
      "fa-solid fa-camera"
    else
      "fa-solid fa-circle-question"
    end
  end
end

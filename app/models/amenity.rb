class Amenity < ApplicationRecord
  has_many :location_amenities
  has_many :locations, through: :location_amenities

  def icon_class
    case key.downcase
    when "water_bowls"
      "fas fa-faucet-drip"
    when "outdoor_seating"
      "fa-solid fa-umbrella-beach"
    when "pet_menu"
      "fa-solid fa-bone"
    when "off_leash_area"
      "fa-solid fa-tree "
    when "indoor_allowed"
      "fa-solid fa-house"
    else
      "fa-solid fa-circle-question"
    end
  end
end

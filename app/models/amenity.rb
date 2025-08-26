class Amenity < ApplicationRecord
  has_many :location_amenities
  has_many :locations, through: :location_amenities

  def icon_class
    case key.downcase
    when "water_bowls"
      "fas fa-faucet-drip"
    # when ""
    #   "fa-solid "
    # when ""
    #   "fa-solid "
    else
      "fa-solid fa-circle-question"
    end
  end
end

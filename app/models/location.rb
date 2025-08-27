class Location < ApplicationRecord
  acts_as_favoritable
  
  belongs_to :owner, class_name: "User", optional: true
  has_many :reviews, dependent: :destroy

  has_many :location_amenities
  has_many :amenities, through: :location_amenities

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end

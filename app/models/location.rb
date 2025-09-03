class Location < ApplicationRecord
  acts_as_favoritable
  CATEGORIES = ["Cafe", "Restaurant", "Shop", "Park"]
  belongs_to :owner, class_name: "User", optional: true
  has_many :reviews, dependent: :destroy

  has_many :location_amenities
  has_many :amenities, through: :location_amenities
  has_one_attached :photo
  has_many :users, through: :reviews

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }

  def avg_rating
  return 'No reviews' if reviews.empty?

  reviews.pluck(:rating).sum.fdiv(reviews.length).round
  end
end

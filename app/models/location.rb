class Location < ApplicationRecord
  acts_as_favoritable
  
  belongs_to :owner, class_name: "User", optional: true
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end

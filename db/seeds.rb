# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Location.create!(
  owner_id: 1,
  name: "Pet Paradise Café",
  category: "Cafe",
  address: "123 Dog St.",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "123-4567",
  lat: 35.689487,
  lng: 139.691711,
  website: "https://petparadise.jp",
  phone: "03-1234-5678",
  source: "seed"
)

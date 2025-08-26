# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clearing old data..."
Favorite.destroy_all
Review.destroy_all
LocationAmenity.destroy_all
Amenity.destroy_all
Location.destroy_all
User.destroy_all

puts "Seeding users..."
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  role: :admin
)

alice = User.create!(
  name: "Alice",
  email: "alice@example.com",
  password: "password"
)

bob = User.create!(
  name: "Bob",
  email: "bob@example.com",
  password: "password"
)

puts "Seeding amenities..."
amenities = [
  { key: "outdoor_seating", label: "Outdoor Seating" },
  { key: "water_bowls",     label: "Water Bowls" },
  { key: "pet_menu",        label: "Pet Menu" },
  { key: "off_leash_area",  label: "Off-leash Area" },
  { key: "indoor_allowed",  label: "Pets Allowed Indoors" }
].map { |a| Amenity.create!(a) }

puts "Seeding locations..."
park = Location.create!(
  owner: alice,
  name: "Yoyogi Park Dog Run",
  category: "Park",
  address: "2-1 Yoyogi-Kamizonocho, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "151-0052",
  lat: 35.6728,
  lng: 139.6949,
  website: "https://www.tokyo-park.or.jp/park/format/index039.html",
  phone: "03-1234-5678",
  source: "seed"
)

cafe = Location.create!(
  owner: bob,
  name: "Paws & Coffee",
  category: "Cafe",
  address: "1-2-3 Dog Street, Shibuya, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "150-0041",
  lat: 35.6595,
  lng: 139.7005,
  website: "https://pawsandcoffee.example.com",
  phone: "03-9876-5432",
  source: "seed"
)

puts "Assigning amenities..."
LocationAmenity.create!(location: park, amenity: amenities[1]) # Water bowls
LocationAmenity.create!(location: park, amenity: amenities[3]) # Off-leash area
LocationAmenity.create!(location: cafe, amenity: amenities[0]) # Outdoor seating
LocationAmenity.create!(location: cafe, amenity: amenities[2]) # Pet menu
LocationAmenity.create!(location: cafe, amenity: amenities[4]) # Indoor allowed

puts "Seeding reviews..."
Review.create!(
  location: park,
  user: bob,
  rating: 5,
  body: "Amazing dog run! Lots of space and friendly pups."
)

Review.create!(
  location: cafe,
  user: alice,
  rating: 4,
  body: "Great coffee and my dog loved the pet menu. A bit crowded on weekends."
)

puts "Seeding favorites..."
alice.favorite(cafe)
bob.favorite(park)

puts "✅ Seeding complete!"

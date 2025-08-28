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
  { key: "water",         label: "Water Fountains" },
  { key: "trash",         label: "Trash Cans" },
  { key: "shades",        label: "Shaded Area" },
  { key: "indoor",        label: "Indoor" },
  { key: "dog_run",       label: "Dog run" },
  { key: "menu",          label: "Pet-friendly menu" },
  { key: "leash_station", label: "Leash Holder" },
  { key: "beds",          label: "Dog Beds" },
  { key: "warm",          label: "Heated Areas" },
  { key: "cool",          label: "Cooling Areas" },
  { key: "showers",       label: "Dog Showers" },
  { key: "strollers",     label: "Dog Strollers" },
  { key: "photos",        label: "Photo spots" }
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

dog_cafe = Location.create!(
  owner: alice,
  name: "Wan Wan Terrace Cafe",
  category: "Cafe",
  address: "5-17-6 Jingumae, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "150-0001",
  lat: 35.6673,
  lng: 139.7081,
  website: "https://wanwanterrace.example.com",
  phone: "03-5555-1111",
  source: "seed"
)

pet_store = Location.create!(
  owner: bob,
  name: "Shinjuku Pet Paradise",
  category: "Pet Store",
  address: "3-38-1 Shinjuku, Shinjuku City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "160-0022",
  lat: 35.6905,
  lng: 139.7004,
  website: "https://petparadise.example.com",
  phone: "03-5555-2222",
  source: "seed"
)

hotel = Location.create!(
  owner: alice,
  name: "Tokyo Pet Stay Hotel",
  category: "Hotel",
  address: "1-9-1 Marunouchi, Chiyoda City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "100-0005",
  lat: 35.6812,
  lng: 139.7671,
  website: "https://tokyopetstay.example.com",
  phone: "03-5555-3333",
  source: "seed"
)

vet = Location.create!(
  owner: bob,
  name: "Harajuku Animal Clinic",
  category: "Veterinary Clinic",
  address: "1-10-2 Jingumae, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "150-0001",
  lat: 35.6710,
  lng: 139.7055,
  website: "https://harajukuanimalclinic.example.com",
  phone: "03-5555-4444",
  source: "seed"
)

pet_friendly_shop = Location.create!(
  owner: alice,
  name: "Dog Dept Harajuku",
  category: "Shop",
  address: "6-7-5 Jingumae, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "150-0001",
  lat: 35.6679,
  lng: 139.7086,
  website: "https://dogdept.example.com",
  phone: "03-5555-5555",
  source: "seed"
)

puts "Assigning amenities..."

LocationAmenity.create!(location: park, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: park, amenity: Amenity.find_by!(key: "dog_run"))
LocationAmenity.create!(location: park, amenity: Amenity.find_by!(key: "trash"))
LocationAmenity.create!(location: park, amenity: Amenity.find_by!(key: "shades"))

LocationAmenity.create!(location: cafe, amenity: Amenity.find_by!(key: "shades"))
LocationAmenity.create!(location: cafe, amenity: Amenity.find_by!(key: "menu"))
LocationAmenity.create!(location: cafe, amenity: Amenity.find_by!(key: "indoor"))
LocationAmenity.create!(location: cafe, amenity: Amenity.find_by!(key: "leash_station"))
LocationAmenity.create!(location: cafe, amenity: Amenity.find_by!(key: "beds"))

LocationAmenity.create!(location: dog_cafe, amenity: Amenity.find_by!(key: "menu"))
LocationAmenity.create!(location: dog_cafe, amenity: Amenity.find_by!(key: "beds"))
LocationAmenity.create!(location: dog_cafe, amenity: Amenity.find_by!(key: "warm"))
LocationAmenity.create!(location: dog_cafe, amenity: Amenity.find_by!(key: "cool"))

LocationAmenity.create!(location: pet_store, amenity: Amenity.find_by!(key: "cool"))
LocationAmenity.create!(location: pet_store, amenity: Amenity.find_by!(key: "strollers"))
LocationAmenity.create!(location: pet_store, amenity: Amenity.find_by!(key: "menu"))

LocationAmenity.create!(location: hotel, amenity: Amenity.find_by!(key: "indoor"))
LocationAmenity.create!(location: hotel, amenity: Amenity.find_by!(key: "beds"))
LocationAmenity.create!(location: hotel, amenity: Amenity.find_by!(key: "warm"))
LocationAmenity.create!(location: hotel, amenity: Amenity.find_by!(key: "cool"))
LocationAmenity.create!(location: hotel, amenity: Amenity.find_by!(key: "photos"))

LocationAmenity.create!(location: vet, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: vet, amenity: Amenity.find_by!(key: "showers"))
LocationAmenity.create!(location: vet, amenity: Amenity.find_by!(key: "indoor"))

LocationAmenity.create!(location: pet_friendly_shop, amenity: Amenity.find_by!(key: "leash_station"))
LocationAmenity.create!(location: pet_friendly_shop, amenity: Amenity.find_by!(key: "photos"))
LocationAmenity.create!(location: pet_friendly_shop, amenity: Amenity.find_by!(key: "strollers"))


puts "Seeding reviews..."

Review.create!(
  location: park,
  user: alice,
  rating: 4,
  body: "Nice park with lots of space, though weekends get crowded."
)

Review.create!(
  location: cafe,
  user: admin,
  rating: 5,
  body: "Perfect spot to work with my pup. Friendly staff and great drinks."
)

Review.create!(
  location: dog_cafe,
  user: bob,
  rating: 4,
  body: "Cozy cafe, my dog loved the biscuits. Tables a bit small for larger dogs."
)
Review.create!(
  location: dog_cafe,
  user: alice,
  rating: 5,
  body: "Such a welcoming place — shaded terrace is a lifesaver in summer."
)

Review.create!(
  location: pet_store,
  user: admin,
  rating: 5,
  body: "Huge selection of toys and accessories, plus stroller rentals are handy."
)

Review.create!(
  location: hotel,
  user: bob,
  rating: 5,
  body: "We stayed over a weekend. Heated dog beds were amazing in winter."
)

Review.create!(
  location: vet,
  user: alice,
  rating: 5,
  body: "Very caring staff, they even had a shower station for muddy paws."
)
Review.create!(
  location: vet,
  user: admin,
  rating: 4,
  body: "Excellent clinic, but parking can be tricky during peak hours."
)

Review.create!(
  location: pet_friendly_shop,
  user: bob,
  rating: 4,
  body: "Trendy dog clothes and accessories, plus a great photo wall."
)

puts "Seeding favorites..."

alice.favorite(cafe)
alice.favorite(dog_cafe)
alice.favorite(pet_store)

bob.favorite(park)
bob.favorite(hotel)
bob.favorite(pet_friendly_shop)

admin.favorite(vet)
admin.favorite(dog_cafe)
admin.favorite(park)


puts "✅ Seeding complete!"

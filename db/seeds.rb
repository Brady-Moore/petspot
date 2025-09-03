# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Clearing old data..."
Favorite.destroy_all
Review.destroy_all
LocationAmenity.destroy_all
Amenity.destroy_all
Location.destroy_all
User.destroy_all

puts "Seeding users..."
pedro = User.create!(
  name: "Pedro",
  email: "pedro@example.com",
  password: "password",
  role: :admin
)
file = File.open("app/assets/images/pedro.jpg")
pedro.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpg")
pedro.save

pet = Pet.create!(
  name: "Lily",
  size: "large",
  breed: "Husky",
  user: pedro
)

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

puts "Seeding locations with photos..."

yoyogi = Location.create!(
  owner: nil,
  name: "Yoyogi Park Dog Run",
  category: "Park",
  address: "2-1 Yoyogi-Kamizonocho, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "151-0052",
  lat: 35.6728,
  lng: 139.6949,
  website: "https://www.tokyo-park.or.jp/park/yoyogi/index.html",
  phone: "03-1234-5678",
  source: "seed"
)

file = URI.open("https://res.cloudinary.com/dwagybbxc/image/upload/v1756705268/1311301001_51_kjljy0.jpg")
yoyogi.photos.attach(io: file, filename: "yoyogi.jpg", content_type: "image/jpg")


komazawa = Location.create!(
  owner: nil,
  name: "Komazawa Olympic Park Dog Run",
  category: "Park",
  address: "1-1 Komazawa Park, Setagaya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "154-0013",
  lat: 35.6264,
  lng: 139.6611,
  website: "https://www.tokyo-park.or.jp/park/komazawa-olympic/index.html",
  phone: "03-1234-5679",
  source: "seed"
)

file = URI.open("https://res.cloudinary.com/dwagybbxc/image/upload/v1756705295/1311201002_71_qpmi4i.jpg")
komazawa.photos.attach(io: file, filename: "komazawa.jpg", content_type: "image/jpg")

bowls = Location.create!(
  owner: nil,
  name: "Bowls Cafe",
  category: "Cafe",
  address: "1F Kasumi Building, 2-5-16 Shinjuku, Shinjuku-ku, Tokyo, Japan",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "160-0022",
  lat: 35.69384,
  lng: 139.70355,
  website: "https://bowlscafe.com/",
  phone: 03-3341-4331,
  source: "seed"
)


file = URI.open("https://res.cloudinary.com/dwagybbxc/image/upload/v1756707637/top05_fym8eo.png")
bowls.photos.attach(io: file, filename: "bowls_cafe.jpg", content_type: "image/png")

dog_dept = Location.create!(
  owner: nil,
  name: "Dog Dept + Cafe",
  category: "Cafe",
  address: "1F 2-1-30 Komagata, Taito-ku, Tokyo, Japan",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "111-0043",
  lat: 35.70604,
  lng: 139.79456,
  website: "https://www.dogdept.com/shoplist/area03_21.html",
  phone: "03-5828-3936",
  source: "seed"
)

file = URI.open("https://res.cloudinary.com/dwagybbxc/image/upload/v1756706659/image-49-1024x683_gok1fw.png")
dog_dept.photos.attach(io: file, filename: "dog_dept.jpg", content_type: "image/png")

kiba_park = Location.create!(
  owner: nil,
  name: "Kiba Park Dog Run",
  category: "Park",
  address: "4-6-1 Kiba, Koto City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "135-0042",
  lat: 35.6731,
  lng: 139.8174,
  website: "https://www.tokyo-park.or.jp/park/format/index008.html",
  phone: "03-2222-1111",
  source: "seed"
)

file = URI.open("https://res.cloudinary.com/dwagybbxc/image/upload/v1756707092/d3e15506f0291ccf789dfda05d082be1c19a5974_nwufuj.jpg")
kiba_park.photos.attach(io: file, filename: "kiba_park.jpg", content_type: "image/jpg")

test_location = Location.create!(
    owner: alice,
  name: "Test Location",
  category: "Test",
  address: "1-2-3- Meguro, Shibuya City, Tokyo",
  city: "Tokyo",
  prefecture: "Tokyo",
  postal_code: "123-1234",
  lat: 30,
  lng: 130,
  website: "https://testdog.example.com",
  phone: "080-9999-9999",
  source: "seed"
)

puts "Assigning amenities..."

# Parks
LocationAmenity.create!(location: yoyogi, amenity: Amenity.find_by!(key: "dog_run"))
LocationAmenity.create!(location: yoyogi, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: yoyogi, amenity: Amenity.find_by!(key: "trash"))
LocationAmenity.create!(location: yoyogi, amenity: Amenity.find_by!(key: "shades"))

LocationAmenity.create!(location: komazawa, amenity: Amenity.find_by!(key: "dog_run"))
LocationAmenity.create!(location: komazawa, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: komazawa, amenity: Amenity.find_by!(key: "trash"))
LocationAmenity.create!(location: komazawa, amenity: Amenity.find_by!(key: "showers"))

LocationAmenity.create!(location: kiba_park, amenity: Amenity.find_by!(key: "dog_run"))
LocationAmenity.create!(location: kiba_park, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: kiba_park, amenity: Amenity.find_by!(key: "trash"))
LocationAmenity.create!(location: kiba_park, amenity: Amenity.find_by!(key: "shades"))

# Cafes & Restaurants

LocationAmenity.create!(location: bowls, amenity: Amenity.find_by!(key: "menu"))
LocationAmenity.create!(location: bowls, amenity: Amenity.find_by!(key: "indoor"))
LocationAmenity.create!(location: bowls, amenity: Amenity.find_by!(key: "warm"))
LocationAmenity.create!(location: bowls, amenity: Amenity.find_by!(key: "cool"))

# Shops
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "photos"))
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "strollers"))
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "leash_station"))

#Test Location
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "water"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "trash"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "shades"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "indoor"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "dog_run"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "menu"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "leash_station"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "beds"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "warm"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "cool"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "showers"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "strollers"))
LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "photos"))


puts "Seeding reviews..."

Review.create!(
  location: yoyogi,
  user: alice,
  rating: 5,
  body: "Huge off-leash area and plenty of shade. Weekends are busy but fun!"
)

Review.create!(
  location: yoyogi,
  user: bob,
  rating: 4,
  body: "Great space to run. Bring water on hot days — the fountains help."
)

Review.create!(
  location: komazawa,
  user: admin,
  rating: 5,
  body: "Clean, organized, and big. Perfect for fetch and social dogs."
)

Review.create!(
  location: komazawa,
  user: alice,
  rating: 4,
  body: "Love the separate zones. Could use more seating for owners."
)

Review.create!(
  location: kiba_park,
  user: bob,
  rating: 4,
  body: "Nice loop for walks, dog run is solid. Shady spots are a plus."
)

Review.create!(
  location: bowls,
  user: admin,
  rating: 5,
  body: "Cozy café, staff were super friendly with my pup. Indoor seating is clutch."
)

Review.create!(
  location: bowls,
  user: alice,
  rating: 4,
  body: "Good coffee, dog water bowls ready. Gets crowded at lunch."
)

Review.create!(
  location: dog_dept,
  user: bob,
  rating: 5,
  body: "Great merch and café menu. Photo spot is adorable!"
)

Review.create!(
  location: dog_dept,
  user: alice,
  rating: 4,
  body: "Leash hooks at tables are so convenient. Dessert was great."
)

Review.create!(
  location: test_location,
  user: admin,
  rating: 3,
  body: "Test spot: has the basics, excited to see how it grows."
)


puts "Seeding favorites..."

alice.favorite(yoyogi)
alice.favorite(bowls)
alice.favorite(dog_dept)

bob.favorite(komazawa)
bob.favorite(kiba_park)
bob.favorite(dog_dept)

admin.favorite(yoyogi)
admin.favorite(komazawa)
admin.favorite(bowls)

puts "✅ Seeding complete!"

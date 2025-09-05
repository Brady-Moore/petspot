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
  role: :admin,
  latitude: 35.657167,
  longitude: 139.703167,
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
  role: :admin,
  latitude: 35.657167,
  longitude: 139.703167,
)

alice = User.create!(
  name: "Alice",
  email: "alice@example.com",
  password: "password",
  latitude: 35.657167,
  longitude: 139.703167,
)

bob = User.create!(
  name: "Bob",
  email: "bob@example.com",
  password: "password",
  latitude: 35.657167,
  longitude: 139.703167,
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
  { key: "photo",        label: "Photo spots" }
].map { |a| Amenity.create!(a) }

puts "Seeding locations with photo..."

yoyogi = Location.create!(
  owner: nil,
  name: "Yoyogi Park Dog Run",
  category: "Park",
  address: "2-1 Yoyogi-Kamizonocho, Shibuya City, Tokyo",
  city: "Shibuya",
  prefecture: "Tokyo",
  postal_code: "151-0052",
  lat: 35.6728,
  lng: 139.6949,
  website: "https://www.tokyo-park.or.jp/park/yoyogi/index.html",
  phone: "03-1234-5678",
  source: "seed"
)

file = URI.open("https://tokyo-park.net/wp-content/uploads/1311301001_51.jpg")
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

file = URI.open("https://tokyo-park.net/wp-content/uploads/1311201002_51.jpg")
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
  phone: "03-3341-4331",
  source: "seed"
)

file = URI.open("https://news.cafesnap.me/wp-content/uploads/2019/12/07.jpg")
bowls.photos.attach(io: file, filename: "bowls.jpg", content_type: "image/jpg")

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

file = URI.open("https://rimage.gnst.jp/rest/img/ce4bpy0g0000/s_001e.jpg")
dog_dept.photos.attach(io: file, filename: "dog_dept.jpg", content_type: "image/jpg")

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

file = URI.open("https://tokyo-park.net/wp-content/uploads/1310801002_51.jpg")
kiba_park.photos.attach(io: file, filename: "kiba_park.jpg", content_type: "image/jpg")

  wonderful_nature_village = Location.create!(
    name: "Wonderful Nature Village",
    category: "Park",
    address:  "Tokyo, Akiruno, Kamiyotsugi, 白岩60",
    city: "Akiruno",
    prefecture: "Tokyo",
    postal_code: "197-0832",
    lat: "35.717456240518544",
    lng: "139.2617632864416",
    website: "https://www.wnv.tokyo/intro",
    phone: "042558586",
    amenities: [Amenity.find_by(key: "water")]
  )

    file = URI.open("https://svcstrg.cld.navitime.jp/imgfile/02301_14402339_01.jpg")
  wonderful_nature_village.photos.attach(io: file, filename: "wonderful_nature_village.jpg", content_type: "image/jpg")

  wankonoshippo = Location.create!(
    name: "Wankonoshippo",
    category: "Cafe",
    address: "2 Chome-23-7 Nakamagome, Ota City, Tokyo",
    city: "Nakagome",
    prefecture: "Tokyo",
    postal_code: "143-0027",
    lat: "35.59449620523742",
    lng: "139.71086923674963",
    website: "https://wankonoshippp.com/",
    phone: "035728932",
    amenities: [Amenity.find_by(key: "water")]
  )

    file = URI.open("https://wankonoshippp.com/wp-content/uploads/2025/05/IMG_6478.jpg")
    wankonoshippo.photos.attach(io: file, filename: "wankonoshippo.jpg", content_type: "image/jpg")

  sippopo_dogrun = Location.create!(
    name: "SIPPOPO DOGRUN",
    category: "Dog run",
    address: "5 Chome-2-16 Chigasakihigashi, Tsuzuki Ward, Yokohama, Kanagawa",
    city: "Chigasaki Higashi",
    prefecture: "Kanagawa",
    postal_code: "224-0033",
    lat: "35.54742178922918",
    lng: "139.58231344001123",
    website: "http://sippopo.com/dogrun",
    phone: "045263620",
    amenities: [Amenity.find_by(key: "water")]
  )

  file = URI.open("https://www.honda.co.jp/dog/travel/data/sippopodogrun/image/01.jpg")
  sippopo_dogrun.photos.attach(io: file, filename: "sippopo_dogrun.jpg", content_type: "image/jpg")


  minato_dog_park = Location.create!(
    name: "Minato Dog Park",
    category: "Dog park",
    address: "1 Chome-2-28 Konan, Minato City, Tokyo",
    city: "Minato city",
    prefecture: "Tokyo",
    postal_code: "108-0075",
    lat: "35.63843834043306",
    lng: ", 139.74462184423902",
    website: "https://www.city.minato.tokyo.jp/shiba-koudoboku/shibaura/koho/dogguran.html",
    phone: "05654545322",
    amenities: [Amenity.find_by(key: "water")]
  )

  file = URI.open("https://minatokankoprod.blob.core.windows.net/assets/2022/02/01/05/15/19/05%20DSCF9759.jpg")
  minato_dog_park.photos.attach(io: file, filename: "minato_dog_park.jpg", content_type: "image/jpg")


  dog_park_meguro = Location.create!(
    category: "Dog park Meguro",
    address: "5-chōme-20-1 Yakumo, 世田谷区 Meguro City, Tokyo 152-0023",
    city: "Meguro City",
    prefecture: "Tokyo",
    postal_code: "152-0023",
    lat: "35.62425929283944",
    lng: " 139.66414491349343",
    website: "http://www.tef.or.jp/kopgp/dogrun.jsp",
    phone: "+8133421643",
    amenities: [Amenity.find_by(key: "water")]
  )

  file = URI.open("https://d3ekkvinch1ig5.cloudfront.net/parkThumb/292772368.jpg")
  dog_park_meguro.photos.attach(io: file, filename: "dog_park_meguro.jpg", content_type: "image/jpg")


  roka_koshuen_dog_run = Location.create!(
    name: "Roka Koshu-en Dog Run",
    category: "Dog run",
    address: "1 Chome-20-1 Kasuya, Setagaya City, Tokyo 157-0063",
    city: "Setagaya",
    prefecture: "Tokyo",
    postal_code: "157-0063",
    lat: "35.66288767683495",
    lng: "139.6123802456559",
    website: "https://www.tokyo-park.or.jp/park/format/index007.html",
    phone: "033302501",
    amenities: [Amenity.find_by(key: "water")]
  )

   file = URI.open("https://tokyo-park.net/wp-content/uploads/1320701004_61.jpg")
  roka_koshuen_dog_run.photos.attach(io: file, filename: "roka_koshuen_dog_run.jpg", content_type: "image/jpg")

  cafe_slow_table = Location.create!(
    name: "Slow Table",
    category: "Cafe",
    city: "Meguro",
    prefecture: "Tokyo",
    lat: "35.639872630837424",
    lng: "139.6982103792007",
    phone: "033302501",
    amenities: Amenity.where(key: ["beds", "menu", "water", "warm"])
  )
  file = URI.open("https://good-life-with-dog.com/wp-content/uploads/2018/11/181129_SLOW-TABLE_000.jpg")
  cafe_slow_table.photos.attach(io: file, filename: "cafe_slow_table.jpg", content_type: "image/jpg")

   bibiche = Location.create!(
    name: "ドッグ バル BIBICHE （ビビバル",
    category: "Cafe",
    city: "Shinagawa",
    prefecture: "Tokyo",
    lat: "35.62930308717976",
    lng: "139.71243972883667",
    amenities: Amenity.where(key: ["beds", "menu", "water", "warm"])
  )
  file = URI.open("https://pomeranianlife.com/wp-content/uploads/2024/10/dd08cd9f872581ab438bc7eb6226ad97-1024x682.jpg")
  bibiche.photos.attach(io: file, filename: "bibiche.jpg", content_type: "image/jpg")

   areverie_terrace_table = Location.create!(
    name: "Areverie Terrace Ebisu",
    category: "Cafe",
    city: "Shibuya",
    prefecture: "Tokyo",
    lat: "35.652214609226036",
    lng: "139.7125345733212",
     amenities: Amenity.where(key: ["beds", "menu", "water", "warm"])
   )

  file = URI.open("https://cdn-ak.f.st-hatena.com/images/fotolife/R/RICO2000/20201116/20201116194212.jpg")
  areverie_terrace_table.photos.attach(io: file, filename: "areverie_terrace_table.jpg", content_type: "image/jpg")

  inu_mimi_cafe = Location.create!(
    name: "Inu Mimi Cafe",
    category: "Cafe",
    city: "Meguro",
    prefecture: "Tokyo",
    lat: "35.64687281466185",
    lng: "139.68544413373385",
    amenities: Amenity.where(key: ["beds", "menu", "water", "warm"])
  )
  file = URI.open("https://wanwan-dog.jp/wp-content/uploads/IMG_2723.jpg")
  inu_mimi_cafe.photos.attach(io: file, filename: "inu_mimi_cafe.jpg", content_type: "image/jpg")

diner = Location.create!(
    name: "33 Diner",
    category: "Cafe",
    city: "Hitachinaka",
    prefecture: "Ibaraki",
    lat: "36.399078314684914",
    lng: "140.5422881967227",
    amenities: Amenity.where(key: ["beds", "menu", "water", "warm"])
  )
  file = URI.open("https://image.co-trip.jp/common/userpost/images_l/202502/31158_13074033_sub_0_740431924.jpg")
  diner.photos.attach(io: file, filename: "diner.jpg", content_type: "image/jpg")

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
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "photo"))
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "strollers"))
LocationAmenity.create!(location: dog_dept, amenity: Amenity.find_by!(key: "leash_station"))

#Test Location
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "water"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "trash"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "shades"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "indoor"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "dog_run"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "menu"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "leash_station"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "beds"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "warm"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "cool"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "showers"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "strollers"))
# LocationAmenity.create!(location: test_location, amenity: Amenity.find_by!(key: "photo"))


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
  location: inu_mimi_cafe,
  user: alice,
  rating: 2,
  body: "My dog didn't like the food:("
)

Review.create!(
  location: cafe_slow_table,
  user: bob,
  rating: 4,
  body: "Staff was very friendly and the cafe itself was very cozy."
)

Review.create!(
  location: cafe_slow_table,
  user: alice,
  rating: 5,
  body: "The food was amazing, my dog loved the treats and the staff was so nice."
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

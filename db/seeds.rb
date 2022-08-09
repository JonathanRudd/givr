# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Destroying all pickups"
Pickup.destroy_all
puts "Destroying all items"
Item.destroy_all
puts "Destroying all users"
User.destroy_all

puts "creating Keanu and 5 other users"

User.create!(
  email: "Keanu@gmail.com",
  password: "123456",
  longitude: 40.7411,
  latitude: 73.9897,
  address: "Flatiron Building, New York City"
)

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    address: Faker::Address.full_address
  )
end

puts "creating Keanus surfboard and 20 other items"

Item.create!(
  user_id: User.first.id,
  title: "Surfboard",
  description: "2nd hand surfboard, still looks great",
  timeframe: "Whoa, whenever"
)

20.times do

  user_ids = User.all.pluck(:id)

  Item.create!(
    user_id: user_ids.sample,
    title: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
    description: "This #{Faker::Hacker.adjective} is great for #{Faker::Hobby.activity}",
    timeframe: "Free on Weekends"
  )
end

# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
# item = Item.new()
# item.image.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "creating 10 pickups"

10.times do

  user_ids = User.all.pluck(:id)
  item_ids = Item.all.pluck(:id)
  # enum_times = [1, 2, 3]

  Pickup.create!(
    user_id: user_ids.sample,
    item_id: item_ids.sample,
    status: "pending",
    note: Faker::Lorem.sentences(number: 1),
    time: rand(5),
    date: Faker::Date.between(from: Date.today, to: 1.week.from_now)
  )
end

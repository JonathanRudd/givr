# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'


puts "Destroying all users"
User.destroy_all

puts "creating Keanu and 5 other users"

User.create!(
  email: "Keanu@gmail.com",
  password: "123456"
)

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
end

# 20.times do
#   Item.create!(
#     user_id: user_ids.sample,
#   )
# end

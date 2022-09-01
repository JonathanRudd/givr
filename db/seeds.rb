# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Destroying all Notifications"
Notification.destroy_all
puts "Destroying all pickups"
Pickup.destroy_all
puts "Destroying all items"
Item.destroy_all
puts "Destroying all users"
User.destroy_all
puts "Destroying all messages"
Message.destroy_all

puts "creating Keanu and 5 other users"

User.create!(
  nickname: "Keany",
  email: "Keanu@gmail.com",
  password: "123456",
  longitude: 139.7082,
  latitude: 35.6338,
  address: "Impact Hub Tokyo, Meguro"
)

User.create!(
  nickname: "Ashish",
  email: "ashish@gmail.com",
  password: "123456",
  longitude: 139.6397,
  latitude: 35.4569,
  address: "Yokohama, MInatomirai"
)


User.create!(
  nickname: "January",
  email: "january@gmail.com",
  password: "123456",
  longitude: 139.7795,
  latitude: 35.6232,
  address: "Odaiba, Tokyo Bay"
)

User.create!(
  nickname: "Mark",
  email: "mark@gmail.com",
  password: "123456",
  longitude: 139.3386,
  latitude: 35.6582,
  address: "Hachioji Station"
)

User.create!(
  nickname: "Jonathan",
  email: "jonathan@gmail.com",
  password: "123456",
  longitude: 139.7667,
  latitude: 35.6834,
  address: "Tokyo Station"
)

# 5.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: "123456",
#     longitude: Faker::Address.longitude,
#     latitude: Faker::Address.latitude,
#     address: Faker::Address.full_address
#   )
# end

seedtags = ["kitchen", "apparel", "tools", "home entertainment", "games", "furniture", "sports"]

puts "creating Keanus surfboard and 20 other items"

surf = Item.create!(
  user_id: User.first.id,
  title: "Surfboard",
  description: "2nd hand surfboard, still looks great",
  timeframe: "Whoa, whenever"
)
surf.tag_list.add("sports equipment")
surf.save!

20.times do
  user_ids = User.all.pluck(:id)

  itemseed = Item.create!(
    user_id: user_ids.sample,
    title: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
    description: "This #{Faker::Hacker.adjective} is great for #{Faker::Hobby.activity}",
    timeframe: "Free on Weekends"
  )
  itemseed.tag_list.add(seedtags.sample(2))
  itemseed.save!
end

# Quality item seeds...

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
item-a = Item.create!(
  user: User.first.id,
  title: "Bicycle",
  description: "Stylish purple bike that will get you to the top! Framesize 49cm. Professionally checked and serviced by a top-level bike mechanic, incl. 3 months technical guarantee.",
  timeframe: "Weekdays morning"
)
item-a.tag_list.add("sports equipment")
f.images.attach(io: file, filename: 'nes.png', content_type: 'image/png')
item-a.save!

# item-b = Item.create!(
#   user: User.first.id,
#   title: "Snowboard",
#   description: "Preowned but in great condition. As used item it's a minor chip and scratches but thes don't compromise the performance. Snowboard w Xylo bindings 138 cm.",
#   timeframe: "Only on weekends morning"
# )
# item-b.tag_list.add("sports equipment")
# item-b.save!

# item-c = Item.create!(
#   user: User.first.id,
#   title: "Golf Club",
#   description: "TAYLORMADE R15 Driver, LOFT: 12°, SHAFT: Fujikura Speeder 57 Evolution Graphite Stiff, Right Hand, VERY NICE CONDITION!!! NO SCRATCHES, DENTS, or PAINT CHIPS",
#   timeframe: "Preferred weekdays after 8PM"
# )
# item-c.tag_list.add("sports equipment")
# item-c.save!

# item-d = Item.create!(
#   user: User.first.id,
#   title: "Lacrosse Shafts",
#   description: "New Brine DV8 women's lacrosse shaft. Lot of two. I have several colors so just let me know which ones you want. Been in storage for awhile but in perfect shape. Thanks for looking.",
#   timeframe: "Mon/Tue/Wed morning only"
# )
# item-d.tag_list.add("sports equipment")
# item-d.save!

# item-e = Item.create!(
#   user: User.first.id,
#   title: "Hockey",
#   description: "Brand New Left Handed Warrior LX Pro | 110 Flex Custom Kink Toe Curve | Ryan O'Reilly - #X53265",
#   timeframe: "Weekdays "
# )
# item-e.tag_list.add("sports equipment")
# item-e.save!

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
f = Item.new(
  user: User.find{1},
  title: "Nintendo set",
  description: "This is a classically styled vintage, possibly antique piece. Solid wood throughout with elegantly turned legs.",
  timeframe: "Weekday evenings"
)
f.tag_list.add("furniture", "antiques")
f.images.attach(io: file, filename: 'nes.png', content_type: 'image/png')
f.save!


# item-g = Item.create!(
#   user: User.first.id,
#   title: "Old leather couch",
#   description: "Vintage condition and a perfect statement in any room. Sad to be giving it away, will be happy to see it go to a cool new home!!",
#   timeframe: "Weekends"
# )
# item-g.tag_list.add("furniture, retro")
# item-g.save!

# item-h = Item.create!(
#   user: User.first.id,
#   title: "Oak wardrobe",
#   description: "Solid pine wardrobe - excellent condition and very well made with a beautiful beeswax finish. Width 90cm, height 187cm",
#   timeframe: "Monday evenings"
# )
# item-h.tag_list.add("furniture")
# item-h.save!

# item-i = Item.create!(
#   user: User.first.id,
#   title: "Cool coat stand",
#   description: "Beautiful wooden coat stand in excellent condition. Height 192cm, width 55cm.",
#   timeframe: "Weekday mornings"
# )
# item-i.tag_list.add("furniture, fashion")
# item-i.save!

# item-j = Item.create!(
#   user: User.first.id,
#   title: "Solid Pine shabby-chic bookcase. It's in good clean condition. Was an unfinished project, but Will make an easy painting project for someone.",
#   description: "Works fine, looks good",
#   timeframe: "Any day after 6pm"
# )
# item-j.tag_list.add("furniture")
# item-j.save!

# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
# item = Item.new()
# item.image.attach(io: file, filename: 'nes.png', content_type: 'image/png')

puts "creating 10 pickups"

10.times do
  user_ids = User.all.pluck(:id)
  item_ids = Item.all.pluck(:id)
  # enum_times = [1, 2, 3]

 pickup = Pickup.create!(
    user_id: user_ids.sample,
    item_id: item_ids.sample,
    note: Faker::Lorem.sentences(number: 1)[0],
    time: rand(0..4),
    date: Faker::Date.between(from: Date.today, to: 1.week.from_now)
  )

  Message.create!(
    user: pickup.item.user,
    pickup: pickup,
    content: "Hi!!! I need this item. How is the condition??"
  )
end

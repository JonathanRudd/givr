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
  nickname: "Keanu",
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
  address: "Yokohama, Minatomirai"
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

# seedtags = ["kitchen", "apparel", "tools", "home entertainment", "games", "furniture", "sports"]

# puts "creating Keanus surfboard and 20 other items"

# surf = Item.create!(
#   user_id: User.first.id,
#   title: "Surfboard",
#   description: "2nd hand surfboard, still looks great",
#   timeframe: "Whoa, whenever"
# )
# surf.tag_list.add("sports equipment")
# surf.save!

# 20.times do
#   user_ids = User.all.pluck(:id)

#   itemseed = Item.create!(
#     user_id: user_ids.sample,
#     title: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
#     description: "This #{Faker::Hacker.adjective} is great for #{Faker::Hobby.activity}",
#     timeframe: "Free on Weekends"
#   )
#   itemseed.tag_list.add(seedtags.sample(2))
#   itemseed.save!
# end

# Item a
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/2/2c/FixedGearBicycle.jpg')
item_a = Item.new(
  user: User.find_by(nickname:"Ashish"),
  title: "Bicycle",
  description: "Stylish fixie bike that will get you to the top! Framesize 49cm. Professionally checked and serviced by a top-level bike mechanic, including a 3 months technical guarantee.",
  timeframe: "Weekday mornings"
)
item_a.tag_list.add("sports equipment")
item_a.images.attach(io: file, filename: 'bicycle.png', content_type: 'image/png')
item_a.save!

# Item b
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/a/a9/F2_Eliminator_Snowboard_Freecarve_Boardercross_163_cm.jpeg')
item_b = Item.new(
  user: User.find_by(nickname:"Keanu"),
  title: "Snowboard",
  description: "Still in great condition. As a used item it has some minor chips and scratches, but it doesn't compromise the performance. Snowboard is 163 cm.",
  timeframe: "Weekend mornings"
)
item_b.tag_list.add("sports equipment")
item_b.images.attach(io: file, filename: 'snowboard.png', content_type: 'image/png')
item_b.save!

# Item c
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/b/b8/Golf_club%2C_Callawax_X-20_4_iron_-_III.jpg')
item_c = Item.new(
  user: User.find_by(nickname:"January"),
  title: "Golf Club",
  description: "R15 Driver, LOFT: 12°, SHAFT: Fujikura Speeder 57 Evolution Graphite Stiff. It's right handed and still in great condition except for a few small dents and scratches.",
  timeframe: "Weekdays after 8PM"
)
item_c.tag_list.add("sports equipment")
item_c.images.attach(io: file, filename: 'golfclub.png', content_type: 'image/png')
item_c.save!

# Item d
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/f1/Lacrosse_stick_8025.jpg')
item_d = Item.new(
  user: User.find_by(nickname:"Jonathan"),
  title: "Lacrosse Shafts",
  description: "New Brine DV8 women's lacrosse shaft. Lot of two. I have several colors, so just let me know which ones you want. Been in storage for awhile but in perfect shape. Thanks for looking.",
  timeframe: "Mon/Tue/Wed morning only"
)
item_d.tag_list.add("sports equipment")
item_d.images.attach(io: file, filename: 'lacrossesticks.png', content_type: 'image/png')
item_d.save!

# Item e
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/f/fa/Roller-hockey-%28Quad%29-Stick.jpg')
item_e = Item.new(
  user: User.find_by(nickname:"Mark"),
  title: "Hockey stick",
  description: "Brand New Left Handed Warrior LX Pro | 110 Flex Custom Kink Toe Curve | Ryan O'Reilly - #X53265",
  timeframe: "Weekdays "
)
item_e.tag_list.add("sports equipment")
item_e.images.attach(io: file, filename: 'Hockeysticks.png', content_type: 'image/png')
item_e.save!

# Item f
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/0/03/PINKxWHITE_3DS_XL_%288225041256%29.jpg')
item_f = Item.new(
  user: User.find_by(nickname:"Ashish"),
  title: "Nintendo 3DS",
  description: "Nintendo 3DS pink no longer needed. Comes with charger, docking Station and carry case. Some minor scratches.",
  timeframe: "Weekday evenings"
)
item_f.tag_list.add("furniture", "antiques")
item_f.images.attach(io: file, filename: '3ds.png', content_type: 'image/png')
item_f.save!

# Item g
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/5/52/Leather_Couch_1_2016-10-01.jpg')
item_g = Item.new(
  user: User.find_by(nickname:"Keanu"),
  title: "Old leather couch",
  description: "Vintage condition and a perfect statement in any room. Sad to be giving it away, will be happy to see it go to a cool new home!!",
  timeframe: "Weekends"
)
item_g.tag_list.add("furniture, retro")
item_g.images.attach(io: file, filename: 'couch.png', content_type: 'image/png')
item_g.save!

# Item h
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/b/b9/Armoire_basque_avec_lauburu.jpg')
item_h = Item.new(
  user: User.find_by(nickname:"January"),
  title: "Oak wardrobe",
  description: "Solid pine wardrobe - excellent condition and very well made with a beautiful beeswax finish. Width 90cm, height 187cm",
  timeframe: "Monday evenings"
)
item_h.tag_list.add("furniture")
item_h.images.attach(io: file, filename: 'wardrobe.png', content_type: 'image/png')
item_h.save!

# Item i
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/3/3a/Gentleman%27s_Oak_Valet.jpg')
item_i = Item.new(
  user: User.find_by(nickname:"Mark"),
  title: "Cool coat stand",
  description: "Beautiful wooden coat stand in excellent condition. Height 192cm, width 55cm.",
  timeframe: "Weekday mornings"
)
item_i.tag_list.add("furniture, fashion")
item_i.images.attach(io: file, filename: 'coatstand.png', content_type: 'image/png')
item_i.save!

# Item j
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/1c/Empty_bookcase.jpg')
item_j = Item.new(
  user: User.find_by(nickname:"Jonathan"),
  title: "Solid Pine shabby-chic bookcase.",
  description: "It's in good clean condition. Was an unfinished project, but Will make an easy painting project for someone.",
  timeframe: "Any day after 6pm"
)
item_j.tag_list.add("furniture")
item_j.images.attach(io: file, filename: 'bookcase.png', content_type: 'image/png')
item_j.save!

# Item k
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/c/c8/Sega_Genesis_%2825343308007%29.jpg')
item_k = Item.new(
  user: User.find_by(nickname:"Jonathan"),
  title: "Sega Genesis",
  description: "Sega Genesis - Model 1 console with power cord as is, not tested.",
  timeframe: "Any evening"
)
item_k.tag_list.add("games")
item_k.images.attach(io: file, filename: 'genesis.png', content_type: 'image/png')
item_k.save!

# Item l
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/c/cc/Game_Boy_Color_Pikachu.jpg')
item_l = Item.new(
  user: User.find_by(nickname:"Mark"),
  title: "Gameboy Color",
  description: "Gameboy colour with Pokémon. Working with the game and comes with batteries",
  timeframe: "Sunday mornings"
)
item_l.tag_list.add("games")
item_l.images.attach(io: file, filename: 'Gameboy.png', content_type: 'image/png')
item_l.save!

# Item m
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/d/de/PlayStation_SCPH-1000_and_PlayStation_Controller_20070713.jpg')
item_m = Item.new(
  user: User.find_by(nickname:"January"),
  title: "PS 1",
  description: "Original PlayStation comes with one controller and power cable. One owner, been carefully looked after. Collection only",
  timeframe: "Thursday evenings"
)
item_m.tag_list.add("games")
item_m.images.attach(io: file, filename: 'PS1.png', content_type: 'image/png')
item_m.save!

# Item n
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/1a/Irem_Madonna_cabs_%283646448090%29.jpg')
item_n = Item.new(
  user: User.find_by(nickname:"Ashish"),
  title: "Arcade machine",
  description: "2 player bartop arcade game for sale. Everything runs fine to my knowledge, gave it a last play on Sunday.",
  timeframe: "Any weekday evening"
)
item_n.tag_list.add("games")
item_n.images.attach(io: file, filename: 'Arcade.png', content_type: 'image/png')
item_n.save!

puts "creating 10 pickups"

10.times do
  user_ids = User.all.pluck(:id)
  item_ids = Item.all.pluck(:id)
  # enum_times = [1, 2, 3]

 pickup = Pickup.create!(
    user_id: user_ids.sample,
    item_id: item_ids.sample,
    note: "Hi!!! This is exactly what I'm looking for. Can I pick it up tomorrow evening?",
    time: rand(0..4),
    date: Faker::Date.between(from: Date.today, to: 1.week.from_now)
  )

  Message.create!(
    user: pickup.item.user,
    pickup: pickup,
    content: "Hi!!! I need this item. How is the condition??"
  )
end

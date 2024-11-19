# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'destroying users'
Item.destroy_all
User.destroy_all
puts 'creating users'

15.times do
  User.create!(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    username: Faker::Internet.username(specifier: 5..10)  ,
    email: Faker::Internet.email,
    password: 'test12345'
  )
end

puts 'done'

puts 'destroying items'

puts 'creating items'

users = User.all

Item.create!(
  name: "Elegant Silk Gown for Gala Event",
  category: "clothing",
  price_per_day: 150,
  description: "This stunning silk gown by designer Atelier Lux will make you the center of attention at any gala. Its intricate draping and timeless silhouette exude sophistication and class, perfect for an unforgettable evening.",
  user_id: users.sample.id
)

Item.create!(
  name: "Chic Black Leather Handbag",
  category: "accessories",
  price_per_day: 120,
  description: "Crafted from premium Italian leather, this sleek black handbag by Raffaello is both timeless and versatile. Perfect for adding an elegant touch to any outfit, whether day or night.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Diamond-Encrusted Earrings",
  category: "jewelry",
  price_per_day: 800,
  description: "These exquisite diamond earrings by Maison Royale feature flawless stones set in 18K white gold. A dazzling accessory that adds glamour to any red carpet or special event.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Luxe Cashmere Sweater",
  category: "clothing",
  price_per_day: 220,
  description: "Indulge in the soft luxury of this cashmere sweater by French label La Maison de Cashmere. Its relaxed fit and neutral color make it an elegant yet cozy addition to any wardrobe.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Vintage Chanel Tweed Jacket",
  category: "clothing",
  price_per_day: 450,
  description: "This iconic Chanel tweed jacket is a statement piece for any occasion. The structured fit and classic pattern will elevate your outfit, offering both timeless appeal and modern style.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Gucci GG Marmont Crossbody Bag",
  category: "accessories",
  price_per_day: 180,
  description: "The Gucci GG Marmont is a versatile and stylish crossbody bag made from supple leather. Its signature GG emblem and chain strap make it the perfect addition to any day-to-night ensemble.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Platinum Solitaire Ring",
  category: "jewelry",
  price_per_day: 1500,
  description: "This show-stopping platinum solitaire ring features a stunning 2-carat diamond, set in a timeless band. Perfect for engagements or special celebrations, it's a piece that symbolizes luxury and eternal love.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Versace Silk Scarf",
  category: "accessories",
  price_per_day: 90,
  description: "Wrap yourself in luxury with this bold and vibrant silk scarf by Versace. The intricate print and rich colors add an elegant flair to any outfit, whether draped over your shoulders or tied around your neck.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Embroidered Valentino Evening Dress",
  category: "clothing",
  price_per_day: 500,
  description: "This Valentino evening dress features delicate floral embroidery, creating a perfect balance between elegance and modern design. Ideal for a sophisticated evening event or gala.",
  user_id: users.sample.id,
)

Item.create!(
  name: "Cartier Love Bracelet",
  category: "jewelry",
  price_per_day: 350,
  description: "The iconic Cartier Love bracelet, crafted from 18K gold, symbolizes passion and commitment. This luxurious piece is perfect for making a statement or as a gift to commemorate a special occasion.",
  user_id: users.sample.id,
)

puts 'done'

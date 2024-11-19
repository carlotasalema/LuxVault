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

item = Item.create!(
  name: "Elegant Silk Gown for Gala Event",
  category: "clothing",
  price_per_day: 150,
  description: "This stunning silk gown by designer Atelier Lux will make you the center of attention at any gala. Its intricate draping and timeless silhouette exude sophistication and class, perfect for an unforgettable evening.",
  user_id: users.sample.id
)
photo = 'https://shop-cdn1-2.vigbo.tech/shops/194883//products/22483207/images/3-06873bf00f2d152be8c8cbda1e84e3f6.jpg?version=undefined'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo1.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Chic Black Leather Handbag",
  category: "accessories",
  price_per_day: 120,
  description: "Crafted from premium Italian leather, this sleek black handbag by Raffaello is both timeless and versatile. Perfect for adding an elegant touch to any outfit, whether day or night.",
  user_id: users.sample.id
)
photo = 'https://www.leatherology.com/media/webImg/Mini-Park-Satchel-894-ED-135-1_fullsize.jpg?width=780'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo2.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Diamond-Encrusted Earrings",
  category: "jewelry",
  price_per_day: 800,
  description: "These exquisite diamond earrings by Maison Royale feature flawless stones set in 18K white gold. A dazzling accessory that adds glamour to any red carpet or special event.",
  user_id: users.sample.id
)
photo = 'https://mesmerizeindia.com/cdn/shop/files/Amelia_Diamond_18K_Gold_Stud_Earrings1_8f55519b-7c34-4065-ab16-6c5e59871a43.jpg?v=1709528399&width=2048'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo3.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Luxe Cashmere Sweater",
  category: "clothing",
  price_per_day: 220,
  description: "Indulge in the soft luxury of this cashmere sweater by French label La Maison de Cashmere. Its relaxed fit and neutral color make it an elegant yet cozy addition to any wardrobe.",
  user_id: users.sample.id
)
photo = 'https://i.pinimg.com/originals/c9/22/bf/c922bf177177382316acd153b7323e6b.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo4.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Vintage Chanel Tweed Jacket",
  category: "clothing",
  price_per_day: 450,
  description: "This iconic Chanel tweed jacket is a statement piece for any occasion. The structured fit and classic pattern will elevate your outfit, offering both timeless appeal and modern style.",
  user_id: users.sample.id
)
photo = 'https://i.pinimg.com/474x/bc/41/92/bc4192aabe64fea91447008dbb47353f.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo5.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Gucci GG Marmont Crossbody Bag",
  category: "accessories",
  price_per_day: 180,
  description: "The Gucci GG Marmont is a versatile and stylish crossbody bag made from supple leather. Its signature GG emblem and chain strap make it the perfect addition to any day-to-night ensemble.",
  user_id: users.sample.id
)
photo = 'https://i.ebayimg.com/images/g/rXkAAOSwaENj9hm-/s-l1200.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo6.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Platinum Solitaire Ring",
  category: "jewelry",
  price_per_day: 1500,
  description: "This show-stopping platinum solitaire ring features a stunning 2-carat diamond, set in a timeless band. Perfect for engagements or special celebrations, it's a piece that symbolizes luxury and eternal love.",
  user_id: users.sample.id
)
photo = 'https://www.chisholmhunter.co.uk/media/catalog/product/cache/335048e4e56311ca480f319b3de673b0/1/-/1-002-60-0081_om_1.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo7.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Versace Silk Scarf",
  category: "accessories",
  price_per_day: 90,
  description: "Wrap yourself in luxury with this bold and vibrant silk scarf by Versace. The intricate print and rich colors add an elegant flair to any outfit, whether draped over your shoulders or tied around your neck.",
  user_id: users.sample.id
)
photo = 'https://img.mytheresa.com/1094/1238/100/jpeg/catalog/product/cb/P00706002_d3.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo8.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Embroidered Valentino Evening Dress",
  category: "clothing",
  price_per_day: 500,
  description: "This Valentino evening dress features delicate floral embroidery, creating a perfect balance between elegance and modern design. Ideal for a sophisticated evening event or gala.",
  user_id: users.sample.id
)
photo = 'https://i.pinimg.com/474x/e1/bf/12/e1bf1230192d5f952550398be63bbed3.jpg'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo9.jpg", content_type: "image/jpg")
item.save

item = Item.create!(
  name: "Cartier Love Bracelet",
  category: "jewelry",
  price_per_day: 350,
  description: "The iconic Cartier Love bracelet, crafted from 18K gold, symbolizes passion and commitment. This luxurious piece is perfect for making a statement or as a gift to commemorate a special occasion.",
  user_id: users.sample.id
)
photo = 'https://mygemma.com/cdn/shop/articles/Cartier_Love_bracelet_sizes.png?v=1715285184'
file = URI.parse(photo).open
item.photo.attach(io: file, filename: "photo10.png", content_type: "image/png")
item.save

puts 'done'

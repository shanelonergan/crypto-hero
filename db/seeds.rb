# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

btc = Crypto.create(
  name: 'Bitcoin',
  buy_price: 10293.18,
  spot_price: 10241.965,
  sell_price: 10190.72
)

user = User.create(
  name: "Shane",
  email: "Shane@gmail.com",
  password: "password",
  bio: "My name is Shane and I like bitcoins and shoes.",
  photo_url: "https://res.cloudinary.com/sagacity/image/upload/c_crop,h_1001,w_1500,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/Kitten_murder_Jeff_Merkley_2_copy_hdpoxd.jpg",
  balance: 10000
  )

10.times do
  Exchange.create(
    user_id: user.id,
    crypto_id: btc.id,
    units: 10,
    buy_price: btc.buy_price,
    buy: true
  )
end

10.times do
  Exchange.create(
    user_id: user.id,
    crypto_id: btc.id,
    units: 5,
    buy_price: btc.buy_price,
    buy: false
  )
end

puts "💰" * 10
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Exchange.destroy_all
Crypto.destroy_all
User.destroy_all



btc = Crypto.create(
  name: 'Bitcoin',
  buy_price: 10000.00,
  spot_price: 10000.00,
  sell_price: 10000.00,
  symbol: 'BTC'
)

user = User.create(
  name: "Shane",
  email: "Shane@gmail.com",
  password: "password",
  bio: "My name is Shane and I like bitcoins and shoes.",
  photo_url: "https://res.cloudinary.com/sagacity/image/upload/c_crop,h_1001,w_1500,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/Kitten_murder_Jeff_Merkley_2_copy_hdpoxd.jpg",
  balance: 10000
  )

1.times do
  Exchange.create(
    user_id: user.id,
    crypto_id: btc.id,
    units: 10,
    market_price: btc.buy_price,
    buy: true
  )
end

2.times do
  Exchange.create(
    user_id: user.id,
    crypto_id: btc.id,
    units: 3,
    market_price: btc.sell_price,
    buy: false
  )
end

puts "💰" * 10

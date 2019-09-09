# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

btc = Cryto.create(
  name: 'Bitcoin',
  buy_price: 10293.18,
  spot_price: 10241.965,
  sell_price: 10190.72
)

Users

10.times do
  Exchange.create(
    user_id: Users.all.sample.id,
    crypto_id: btc.id,
    units_purchased: 10,
    buy_price: btc.buy_price,
    type: true
  )


end

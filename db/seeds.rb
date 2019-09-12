# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  # require 'faker'
  # require "uri"
  # require "net/http"
  # url = URI("api.coincap.io/v2/assets")
  # http = Net::HTTP.new(url.host, url.port)
  # request = Net::HTTP::Get.new(url)
  # response = http.request(request)
  # response_hash = response.read_body

url = "api.coincap.io/v2/assets"
response = RestClient.get(url)
response_hash = JSON.parse(response)



Exchange.destroy_all
Crypto.destroy_all
User.destroy_all

crypto_array = response_hash["data"]


crypto_array.each do |currency|
  Crypto.create(
    api_id: currency["id"],
    symbol: currency["symbol"],
    name: currency["name"],
    spot_price: currency["priceUsd"]
  )
end


# btc = Crypto.create(
#   name: 'Bitcoin',
#   spot_price: nil,
#   symbol: 'BTC',
#   api_id: 'bitcoin'
# )
# eth = Crypto.create(
#   name: 'Ethereum',
#   spot_price: nil,
#   symbol: 'ETH',
#   api_id: 'ethereum'
# )
# xrp = Crypto.create(
#   name: 'XRP',
#   spot_price: nil,
#   symbol: 'XRP',
#   api_id: 'ripple'
# )
# litecoin = Crypto.create(
#   name: 'Litecoin',
#   spot_price: nil,
#   symbol: 'LTC',
#   api_id: 'litecoin'
# )
#
# bitcoin_cash = Crypto.create(
#   name: 'Bitcoin Cash',
#   spot_price: nil,
#   symbol: 'BCH',
#   api_id: 'bitcoin-cash'
# )
#
# bitcoin_cash = Crypto.create(
#   name: 'Bitcoin Cash',
#   spot_price: nil,
#   symbol: 'BCH',
#   api_id: 'bitcoin-cash'
# )

puts "💰" * 10

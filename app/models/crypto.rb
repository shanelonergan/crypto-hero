class Crypto < ApplicationRecord
  has_many :exchanges
  has_many :users, through: :exchanges


  def update_price
    url = "https://blockchain.info/ticker"
    response = RestClient.get(url)
    response_hash = JSON.parse(response)
    usd = response_hash["USD"]
    self.update(buy_price: usd["buy"], sell_price: usd["sell"], spot_price: usd["15m"])
  end

  def dollar_to_unit(amount)
    url = "https://blockchain.info/tobtc?currency=USD&value=#{amount}"
    response = RestClient.get(url)
    units = JSON.parse(response) #number of units bought with this amount
  end

end

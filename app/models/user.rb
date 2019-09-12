class User < ApplicationRecord
  has_many :exchanges, dependent: :destroy
  has_many :cryptos, through: :exchanges

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :password, length: { minimum: 8 }, allow_blank: false

  has_secure_password

  def can_buy?(amount)
    self.balance < amount ? false : true
  end

  def can_sell?(units)
    crypto_owned_total >= units ? true : false
  end

  def investment_total
    buys_total - sells_total
  end

  def buys
    self.exchanges.select { |ex| ex.buy }
  end

  def sells
    self.exchanges.select { |ex| !ex.buy }
  end

  def buys_total
    (buys.map {|buy| buy.market_price * buy.units}).sum
  end

  def sells_total
    (sells.map {|sell| sell.market_price * sell.units}).sum
  end

  def crypto_buys
    (buys.map {|buy| buy.units}).sum
  end

  def crypto_sells
    (sells.map {|sell| sell.units}).sum
  end

  def crypto_owned_total
    crypto_buys - crypto_sells
  end

  def performance
    self.investment_value + self.balance - 100000
  end

  def crypto_total
    buy_hash = self.buys.inject(Hash.new(0)) do |hash, exchange|
      hash[exchange.crypto.name] += exchange.units
      hash
    end
    complete_hash = self.sells.inject(buy_hash) do |hash, exchange|
      hash[exchange.crypto.name] -= exchange.units
      hash
    end
    complete_hash
  end

  def investment_value
    cryptos_owned = self.crypto_total
    return_total = cryptos_owned.inject(0) do |total, (crypto, value)|
        crypto_object = Crypto.find_by(name: crypto)
        if value > 0 
          crypto_object.update_price
        end
        total += crypto_object.spot_price * value
    end
  end



end

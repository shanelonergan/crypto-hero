class User < ApplicationRecord
  has_many :exchanges
  has_many :cryptos, through: :exchanges

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :password, length: { minimum: 8 }, allow_blank: false

  has_secure_password


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


end

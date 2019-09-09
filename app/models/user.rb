class User < ApplicationRecord
  has_many :exchanges
  has_many :cryptos, through: :exchanges


  

  def total
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

end

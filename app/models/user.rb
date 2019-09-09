class User < ApplicationRecord
  has_many :exchanges
  has_many :cryptos, through: :exchanges


  

  def total
   
  end

  def buys
    self.exchanges.select { |ex| ex.buy }
  end

  def buys_total
    (buys.map {|ex| ex.buy_price * ex.units}).sum
  end

  def sells
    self.exchanges.select { |ex| !ex.buy }
  end

  def sells_total
    sells.map {|ex| ex.buy_price }
  end

end

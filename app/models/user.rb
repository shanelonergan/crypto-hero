class User < ApplicationRecord
  has_many :exchanges
  has_many :cryptos, through: :exchanges
end

class Crypto < ApplicationRecord
  has_many :exchanges
  has_many :users, through: :exchanges
end

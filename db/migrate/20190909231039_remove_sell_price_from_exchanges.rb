class RemoveSellPriceFromExchanges < ActiveRecord::Migration[6.0]
  def change

    remove_column :exchanges, :sell_price, :integer
  end
end

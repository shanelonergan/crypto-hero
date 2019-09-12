class RemoveSellPriceFromCryptos < ActiveRecord::Migration[6.0]
  def change
    remove_column :cryptos, :sell_price, :float
  end
end

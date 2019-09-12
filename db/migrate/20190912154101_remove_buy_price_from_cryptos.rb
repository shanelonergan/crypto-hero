class RemoveBuyPriceFromCryptos < ActiveRecord::Migration[6.0]
  def change
    remove_column :cryptos, :buy_price, :float
  end
end

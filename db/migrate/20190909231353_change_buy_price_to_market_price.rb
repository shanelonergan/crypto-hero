class ChangeBuyPriceToMarketPrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :exchanges, :buy_price, :market_price
  end
end

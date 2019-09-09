class CreateCryptos < ActiveRecord::Migration[6.0]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.float :buy_price
      t.float :spot_price
      t.float :sell_price

      t.timestamps
    end
  end
end

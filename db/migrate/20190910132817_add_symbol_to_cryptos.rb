class AddSymbolToCryptos < ActiveRecord::Migration[6.0]
  def change
    add_column :cryptos, :symbol, :string
  end
end

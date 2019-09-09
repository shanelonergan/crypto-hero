class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :crypto, null: false, foreign_key: true
      t.float :total
      t.float :buy_price
      t.float :sell_price
      t.float :units
      t.boolean :buy

      t.timestamps
    end
  end
end

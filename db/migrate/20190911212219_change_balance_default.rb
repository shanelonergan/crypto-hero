class ChangeBalanceDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :balance, :float, default: 100000
  end
end

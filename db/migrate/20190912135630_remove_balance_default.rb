class RemoveBalanceDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :balance, :float
  end
end

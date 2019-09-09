class RemoveTotalFromExchanges < ActiveRecord::Migration[6.0]
  def change

    remove_column :exchanges, :total, :integer
  end
end

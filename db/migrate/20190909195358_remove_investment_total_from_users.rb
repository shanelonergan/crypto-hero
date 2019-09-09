class RemoveInvestmentTotalFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :investment_total, :float
  end
end

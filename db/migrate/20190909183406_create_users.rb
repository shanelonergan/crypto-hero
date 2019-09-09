class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :bio
      t.string :photo_url
      t.float :balance
      t.float :investment_total
  

      t.timestamps
    end
  end
end

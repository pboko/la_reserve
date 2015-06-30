class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :street
      t.string :zip_code
      t.integer :capacity

      t.timestamps null: false
    end
  end
end

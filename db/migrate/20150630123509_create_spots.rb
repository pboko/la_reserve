class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :capacity
      t.string :name
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

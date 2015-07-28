class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :state
      t.boolean :read
      t.references :restaurant, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

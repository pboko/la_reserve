class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.integer :pax
      t.references :restaurant, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :waiter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateBookingSpots < ActiveRecord::Migration
  def change
    create_table :booking_spots do |t|
      t.references :spot, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

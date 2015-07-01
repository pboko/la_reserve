class AddNotesToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :notes, :text
  end
end

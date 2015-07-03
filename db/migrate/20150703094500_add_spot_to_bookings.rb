class AddSpotToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :spot, :string
  end
end

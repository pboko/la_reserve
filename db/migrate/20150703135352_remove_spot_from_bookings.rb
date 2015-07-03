class RemoveSpotFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :spot, :string
  end
end

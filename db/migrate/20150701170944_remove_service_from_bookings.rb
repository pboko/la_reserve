class RemoveServiceFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :service
  end
end

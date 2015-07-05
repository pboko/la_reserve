class AddWaitingListToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :waitinglist, :boolean
  end
end

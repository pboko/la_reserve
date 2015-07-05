class ChangeColumnBookings < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
      t.rename :waitinglist, :waiting_list
    end
  end
end

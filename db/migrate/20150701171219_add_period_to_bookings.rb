class AddPeriodToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :period, :string
  end
end

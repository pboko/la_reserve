class AddServiceToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :service, :string
  end
end

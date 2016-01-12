class AddOpeningDaysToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :opening_days, :string
  end
end

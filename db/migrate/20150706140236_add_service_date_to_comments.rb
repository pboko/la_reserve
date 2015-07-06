class AddServiceDateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :service_date, :date
  end
end

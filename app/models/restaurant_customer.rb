# == Schema Information
#
# Table name: restaurant_customers
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  customer_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_restaurant_customers_on_customer_id    (customer_id)
#  index_restaurant_customers_on_restaurant_id  (restaurant_id)
#

class RestaurantCustomer < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :customer
end

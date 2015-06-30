# == Schema Information
#
# Table name: restaurant_users
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_restaurant_users_on_restaurant_id  (restaurant_id)
#  index_restaurant_users_on_user_id        (user_id)
#

class RestaurantUser < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
end

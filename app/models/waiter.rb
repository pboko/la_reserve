# == Schema Information
#
# Table name: waiters
#
#  id            :integer          not null, primary key
#  name          :string
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_waiters_on_restaurant_id  (restaurant_id)
#

class Waiter < ActiveRecord::Base
  belongs_to :restaurant
  has_many :bookings

  validates :name, presence: true
end

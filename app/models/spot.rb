# == Schema Information
#
# Table name: spots
#
#  id            :integer          not null, primary key
#  capacity      :integer
#  name          :string
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_spots_on_restaurant_id  (restaurant_id)
#

class Spot < ActiveRecord::Base
  belongs_to :restaurant
  has_many :booking_spots
  has_many :bookings, through: :booking_spots

end

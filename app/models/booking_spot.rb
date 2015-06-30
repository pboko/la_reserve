# == Schema Information
#
# Table name: booking_spots
#
#  id         :integer          not null, primary key
#  spot_id    :integer
#  booking_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_booking_spots_on_booking_id  (booking_id)
#  index_booking_spots_on_spot_id     (spot_id)
#

class BookingSpot < ActiveRecord::Base
  belongs_to :spot
  belongs_to :booking
end

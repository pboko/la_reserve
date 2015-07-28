# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  state         :string
#  read          :boolean
#  restaurant_id :integer
#  booking_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_messages_on_booking_id     (booking_id)
#  index_messages_on_restaurant_id  (restaurant_id)
#

class Message < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :booking
end

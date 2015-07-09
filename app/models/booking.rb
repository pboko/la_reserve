# == Schema Information
#
# Table name: bookings
#
#  id            :integer          not null, primary key
#  start_time    :time
#  end_time      :time
#  date          :date
#  pax           :integer
#  restaurant_id :integer
#  customer_id   :integer
#  waiter_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :string
#  notes         :text
#  period        :string
#  waiting_list  :boolean
#  token         :string
#
# Indexes
#
#  index_bookings_on_customer_id    (customer_id)
#  index_bookings_on_restaurant_id  (restaurant_id)
#  index_bookings_on_waiter_id      (waiter_id)
#

class Booking < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :customer
  belongs_to :waiter
  has_many :booking_spots
  has_many :spots, through: :booking_spots

  validates :date, presence: true
  validates :start_time, presence: true
  # validates :end_time, presence: true
  validates :pax, presence: true
  validates :period, presence: true

  scope :for_period, ->(period) { where(:period => period.to_s.capitalize) }
  scope :for_date, ->(date) { where(:date => date) }
  # scope :for_waiting_list, ->(waiting_list) { where(:waiting_list => waiting_list)}

  def self.new_for_evening
    start_time = Time.zone.at(19.hours) + 30.minutes

    new(
      period:     "Soir",
      start_time: start_time
    )
  end
end

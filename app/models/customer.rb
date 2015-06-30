# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  email        :string
#  phone_number :string
#  vip          :boolean
#  status       :string
#  gender       :string
#  comments     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Customer < ActiveRecord::Base
  has_many :restaurant_customers
  has_many :bookings
end

# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  street     :string
#  zip_code   :string
#  capacity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_many :spots
  has_many :restaurant_customers
  has_many :waiters, dependent: :destroy
  has_many :bookings
  has_many :comments
  has_many :restaurant_users, dependent: :destroy
  has_many :users, through: :restaurant_users
  has_many :customers, through: :restaurant_customers

  validates :name, presence: true

end


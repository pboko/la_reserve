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
  has_many :restaurants, through: :restaurant_customers
  has_many :bookings

  # validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end

  scope :for_status, ->(status) { where(:status => status.to_s.upcase) }
end

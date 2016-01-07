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

  def full_name_reverse
    "#{last_name} #{first_name}".strip
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["id", "first_name", "last_name", "email"]
      all.each do |customer|
        csv << [customer.id, customer.first_name, customer.last_name, customer.email]
      end
    end
  end

  scope :for_status, ->(status) { where(:status => status.to_s.upcase) }
end

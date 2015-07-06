# == Schema Information
#
# Table name: restaurants
#
#  id                   :integer          not null, primary key
#  name                 :string
#  city                 :string
#  street               :string
#  zip_code             :string
#  capacity             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
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

  has_attached_file :picture,
    styles: { medium: "150x150>", thumb: "100x100>" }

  validates :name, presence: true

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

end


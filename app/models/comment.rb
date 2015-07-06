# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  content       :text
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_comments_on_restaurant_id  (restaurant_id)
#

class Comment < ActiveRecord::Base
  belongs_to :restaurant
end

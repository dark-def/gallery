# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  image_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ActiveRecord::Base
  attr_accessible :image_id, :user_id

  belongs_to :user
  belongs_to :image
end

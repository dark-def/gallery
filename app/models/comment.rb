# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_id    :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :description, :user_id, :image_id

  belongs_to :user
  belongs_to :image
end

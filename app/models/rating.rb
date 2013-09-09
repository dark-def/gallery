# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  image_id   :integer
#  user_id    :integer
#  mark       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ActiveRecord::Base
  attr_accessible :image_id, :mark, :user_id

  belongs_to :image
  belongs_to :user

end

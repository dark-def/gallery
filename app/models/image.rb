# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Image < ActiveRecord::Base
  attr_accessible :image, :title
  mount_uploader :image, ImagesUploader
end

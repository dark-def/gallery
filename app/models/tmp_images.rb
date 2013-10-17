# == Schema Information
#
# Table name: tmp_images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TmpImages < ActiveRecord::Base
  attr_accessible :image, :title
end

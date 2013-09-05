# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  image          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#  likes_count    :integer          default(0)
#  comments_count :integer          default(0)
#  rating         :float
#

class Image < ActiveRecord::Base

  attr_accessible :image, :title, :category_id, :description

  mount_uploader :image, ImagesUploader

  belongs_to :category

  has_many :comments
  has_many :likes
  has_many :ratings

  validates :image, :category_id,
            :presence => true

end

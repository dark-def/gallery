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

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end

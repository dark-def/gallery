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

require 'spec_helper'

describe Rating do
  pending "add some examples to (or delete) #{__FILE__}"
end

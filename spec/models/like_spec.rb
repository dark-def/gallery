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

require 'spec_helper'

describe Like do

  context 'Like db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:image_id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Like relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
  end

  context 'Like validations' do
    it { should validate_presence_of(:image_id) }
    it { should validate_presence_of(:user_id) }
  end

end
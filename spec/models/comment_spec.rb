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

require 'spec_helper'

describe Comment do

  context 'Comment db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:description).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:image_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Comment mass_assignment' do
    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:image_id) }
  end

  context 'Comment relationship' do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
  end

  context 'Comment validations' do
    it { should ensure_length_of(:description).is_at_least(2).is_at_most(1000) }

    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:image_id) }
  end

end

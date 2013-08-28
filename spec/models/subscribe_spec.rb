# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Subscribe do

  context 'Subscribe db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Subscribe mass_assignment' do
    it { should allow_mass_assignment_of(:category_id) }
    it { should allow_mass_assignment_of(:user_id) }
  end

  context 'Subscribe relationship' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
  end

  context 'Subscribe validations' do
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:user_id) }
  end

end

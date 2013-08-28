# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Category do
  context 'Category db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:title).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Category relationship' do
    it { should have_many(:subscribes) }
    it { should have_many(:users).through(:subscribes) }
    it { should have_many(:images) }
  end

  context 'Category mass_assignment' do
    it { should allow_mass_assignment_of(:title) }
  end

  context 'Category validations' do
    it { should validate_presence_of(:title) }
  end

end

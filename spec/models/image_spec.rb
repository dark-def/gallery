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

  context 'Image db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:title).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:image).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:category_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Image mass_assignment' do
    it { should allow_mass_assignment_of(:image) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:category_id) }
    it { should allow_mass_assignment_of(:description) }
  end

  context 'Image relationship' do
    it { should belong_to(:category) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  context 'Image validations' do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:category_id) }
  end

end
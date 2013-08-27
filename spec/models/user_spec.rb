# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uid                    :string(255)
#  email                  :string(255)
#  provider               :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

require 'spec_helper'

describe User do

  context 'User db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:name).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:uid).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:email).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:provider).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options( :limit => 255, :default => '',:null => false ) }
    it { should have_db_column(:reset_password_token).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:sign_in_count).of_type(:integer).with_options( :default => 0) }
    it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:current_sign_in_ip).of_type(:string).with_options( :limit => 255) }
    it { should have_db_column(:last_sign_in_ip).of_type(:string).with_options( :limit => 255) }
  end

  context 'User mass_assignment' do
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }
    it { should allow_mass_assignment_of(:uid) }
    it { should allow_mass_assignment_of(:provider) }
    it { should allow_mass_assignment_of(:encrypted_password) }
    it { should allow_mass_assignment_of(:reset_password_token) }
    it { should allow_mass_assignment_of(:reset_password_sent_at) }
    it { should allow_mass_assignment_of(:remember_created_at) }
    it { should allow_mass_assignment_of(:current_sign_in_at) }
    it { should allow_mass_assignment_of(:last_sign_in_at) }
    it { should allow_mass_assignment_of(:current_sign_in_ip) }
    it { should allow_mass_assignment_of(:last_sign_in_ip) }
  end

  context 'User relationship' do
    it { should have_many(:subscribes) }
    it { should have_many(:categories).through(:subscribes) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:events) }
  end

  context 'User validations' do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  context 'Valid invalid data for user' do

    it 'blank user email' do
      user = FactoryGirl.build(:user)
      user.name = 'bob'
      user.email = ''
      user.valid?
      user.errors[:email].should include "can't be blank"
    end

    it 'invalid user email' do
      user = FactoryGirl.build(:user)
      user.name = 'bob'
      user.email = 'asdffdsaasdf'
      user.valid?
      user.errors[:email].should include "is invalid"
    end

  end

end
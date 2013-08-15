# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event      :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Event do

  context 'Event db columns' do
    it { should have_db_column(:id).of_type(:integer).with_options( :null => false) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:event).of_type(:string).with_options(:limit => 255) }
    it { should have_db_column(:url).of_type(:string).with_options(:limit => 255) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options( :null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options( :null => false) }
  end

  context 'Event mass_assignment' do
    it { should allow_mass_assignment_of(:event) }
    it { should allow_mass_assignment_of(:url) }
    it { should allow_mass_assignment_of(:user_id) }
  end

  context 'Event relationship' do
    it { should belong_to(:user) }
  end

end
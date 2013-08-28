require 'spec_helper'

describe SubscribeMailer do

  before do
    @image = FactoryGirl.create(:image, :title => 'wat.png', :image => File.new(Rails.root + 'app/assets/images/rails.png'), :category_id => 1)
    @category = FactoryGirl.create(:category)
    @users = Array.new
    3.times do |i|
      @users = ["test#{i}@test.ru"]
    end
  end

  describe 'instructions' do
    let(:mail) { SubscribeMailer.send_mail(@image, @category, @users) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'New image was added'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      @users.each do |value|
        mail.to.should == [value]
      end
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['pair.dro@gmail.com']
    end

  end
end
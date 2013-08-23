require 'spec_helper'

describe ApplicationController do

  describe 'methods' do

    it 'event/write' do
      @user = FactoryGirl.create(:user)
      sign_in @user
      expect{
        Event.create(:url => 'images/1/comments', :user_id => @user.id, :event => 'comment.create')
      }.to change(Event,:count).by(1)
    end

    it 'event/not write' do
      expect{
        Event.create(:url => 'images/1/comments', :event => 'comment.create')
      }.to_not change(Event,:count).by(1)
    end

    it 'set locale if params isset' do
      params = Hash.new
      params[:locale] = 'en'.to_sym
      expect(I18n.locale).to eq(params[:locale])
    end

    it 'set locale if no params' do
      expect(I18n.locale).to eq(I18n.default_locale)
    end

  end

end
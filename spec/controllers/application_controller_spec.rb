require 'spec_helper'

describe ApplicationController do

  describe 'methods' do

    it 'authenticate_user?' do
      post :create, {:image_id => 1, :comment => {:description => 'simple text'} }
      response.should redirect_to('http://test.host/users/sign_in')
    end

    it 'create' do
      sign_in @user
      expect{
        FactoryGirl.create(:comment, :user_id => @user.id, :description => 'simple text', :image_id => '1')
      }.to change(Comment,:count).by(1)
    end

    it 'if saved' do
      sign_in @user
      expect{
        Event.create(:url => 'images/1/comments', :user_id => '1', :event => 'comment.create')
      }.to change(Event,:count).by(1)
    end

  end

end

#
#class ApplicationController < ActionController::Base
#
#  before_filter :set_locale
#  after_filter :click_links
#
#  protect_from_forgery
#
#  include SimpleCaptcha::ControllerHelpers
#
#  def set_locale
#    I18n.locale = params[:locale] || I18n.default_locale
#  end
#
#  def default_url_options(options={})
#    #logger.debug "default_url_options is passed options: #{options.inspect}\n"
#    { :locale => I18n.locale }
#  end
#
#  def click_links
#    if current_user
#      ActiveSupport::Notifications.instrument('click_links', :user_id => current_user.id, :url => request.fullpath)
#    end
#  end
#
#end

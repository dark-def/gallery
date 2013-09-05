class ApplicationController < ActionController::Base

  before_filter :set_locale
  before_filter :set_return, :except => [:create]
  after_filter :click_links

  protect_from_forgery

  include SimpleCaptcha::ControllerHelpers

  def set_locale
    expire_fragment 'category'
    I18n.locale = params[:locale] || cookies[:locale] || I18n.default_locale
    cookies[:locale] = I18n.locale
  end

  def set_return
    session[:return_to] = request.fullpath
  end

  def click_links
    if current_user
      ActiveSupport::Notifications.instrument('click_links', :user_id => current_user.id, :url => request.fullpath)
    end
  end

end

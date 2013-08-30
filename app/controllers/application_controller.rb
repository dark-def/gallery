class ApplicationController < ActionController::Base

  before_filter :set_locale
  before_filter :set_return, :except => [:create]
  after_filter :click_links

  protect_from_forgery

  include SimpleCaptcha::ControllerHelpers

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_return
    session[:return_to] = request.fullpath
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def click_links
    if current_user
      ActiveSupport::Notifications.instrument('click_links', :user_id => current_user.id, :url => request.fullpath)
    end
  end

end

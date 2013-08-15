class ApplicationController < ActionController::Base

  before_filter :set_locale
  before_filter :get_categories
  after_filter :click_links

  caches_action :get_categories

  protect_from_forgery

  include SimpleCaptcha::ControllerHelpers

  def get_categories
    @categories = Category.all
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    #logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def click_links
    if current_user
      ActiveSupport::Notifications.instrument('click_links', :user_id => current_user.id, :url => request.fullpath)
    end
  end

end

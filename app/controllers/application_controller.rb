class ApplicationController < ActionController::Base

  before_filter :set_locale
  after_filter :set_return, :except => [:create, :destoy, :update, :save]
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
      #Resque.enqueue(SimpleJob, “Yahoo!”)
      Resque.enqueue(BGEvents, current_user.id, request.fullpath)
      #ActiveSupport::Notifications.instrument('click_links', :user_id => current_user.id, :url => request.fullpath)
    end
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end

  private
  def render_error(status, exception)
    respond_to do |format|
      format.html { render template: "errors/error_#{status}", layout: 'layouts/application', status: status }
      format.all { render nothing: true, status: status }
    end
  end

end

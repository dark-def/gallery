class SessionsController < Devise::SessionsController

  def create
    super
    if user_signed_in?
      ActiveSupport::Notifications.instrument('sign_in', :user => current_user)
    end
  end

  def destroy
    user = current_user
    super
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    if !user_signed_in?
      ActiveSupport::Notifications.instrument('sign_out', :user => user)
    end
  end

end
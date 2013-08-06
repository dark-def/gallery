class AuthenticationsController < ApplicationController

  def create
    if user_signed_in?
      redirect_to session[:return_to], :alert => 'Не стоит делать это дважды'
    else
      auth = (env['omniauth.auth'])
      @user = User.find_or_create_by_uid(:uid => auth['uid'].to_s) do |user|
        user.password = Devise.friendly_token[0,20]
        user.email = auth['info']['email']
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.name = auth['info']['name']
      end
      sign_in @user
      redirect_to session[:return_to], :notice => 'Loggined successfully!'
    end

  end

  def destroy
    reset_session
    redirect_to :back, :notice => 'Logout successfully!'
  end

end
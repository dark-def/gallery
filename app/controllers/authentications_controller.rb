class AuthenticationsController < ApplicationController

  def create

    auth = (env['omniauth.auth'])
      @user = User.find_or_create_by_email(:email => auth['info']['email'].to_s) do |user|
      user.password = Devise.friendly_token[0,20]
      user.email = auth['info']['email']
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
    end
    sign_in @user
    redirect_to session[:return_to], :notice => 'Loggined successfully!'

  end

  def destroy
    reset_session
    redirect_to :back, :notice => 'Logout successfully!'
  end

end
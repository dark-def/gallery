#require 'spec_helper'
#
#describe AuthenticationsController do
#
#  #it 'if user signed in' do
#  #  @user = FactoryGirl.create(:user)
#  #  sign_in @user
#  #  post :create, {:uid => 123}
#  #    #User.create(:email => @user.email)
#  #    response.should redirect_to session[:return_to]
#  #
#  #  #assert_redirected_to session[:return_to]
#  #  #assert_equal 'Не стоит делать это дважды', flash[:alert]
#  #  #response.body.should redirect_to session[:return_to], flash[:notice]
#  #
#  #end
#
#  it 'if success' do
#    #post :create, {:image_id => @image.id, :comment => { :description => 'comment' } }
#
#    post :create, {:name => 'Bob', :uid => '123123123', :password => Devise.friendly_token[0,20],
#                   :email => 'email@email.ru', :provider => 'provider' }
#    #auth = (env['omniauth.auth'])
#    expect{
#      FactoryGirl.create(:user, :uid => '123456789', :provider => 'provider')
#    }.to change(User,:count).by(1)
#
#  end
#
#
#end
#
##SQL (1.2ms)
##INSERT INTO "users" ("created_at", "current_sign_in_at", "current_sign_in_ip", "email", "encrypted_password", "last_sign_in_at", "last_sign_in_ip", "name", "provider", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sign_in_count", "uid", "updated_at")
##VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
##RETURNING "id"  [
##    ["created_at", Tue, 27 Aug 2013 11:44:26 UTC +00:00],
##    ["email", "drkmen@rambler.ru"],
##    ["encrypted_password", "$2a$10$hSNekWZQZgETMdkl8Y0F3OchlmD6Z3BfFtbi5z1xCL/yi39v/Dw.S"],
##    ["name", "Michael Belyaev"],
##    ["provider", "facebook"],
##    ["uid", "100002111956124"],
##    ["updated_at", Tue, 27 Aug 2013 11:44:26 UTC +00:00]]
#
##class AuthenticationsController < ApplicationController
##
##  def create
##
##    auth = (env['omniauth.auth'])
##    @user = User.find_or_create_by_uid(:uid => auth['uid'].to_s) do |user|
##      user.password = Devise.friendly_token[0,20]
##      user.email = auth['info']['email']
##      user.provider = auth['provider']
##      user.uid = auth['uid']
##      user.name = auth['info']['name']
##    end
##    sign_in @user
##    redirect_to session[:return_to], :notice => 'Loggined successfully!'
##
##  end
##
##  def destroy
##    reset_session
##    redirect_to :back, :notice => 'Logout successfully!'
##  end
##
##end
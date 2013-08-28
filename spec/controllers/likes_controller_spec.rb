require 'spec_helper'

describe LikesController do

  before do
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)

  end

  it 'authenticate_user?' do
    post :create, {:id => @image.id }
    response.should redirect_to('http://test.host/users/sign_in') #new_user_session_path
  end

  it 'create' do
    sign_in @user
    expect{ post :create, {:id => @image.id } }.to change(Like,:count).by(1)
  end

  it 'if saved' do
    sign_in @user
    post :create, {:id => @image.id }

    @json = {
        :status => 'success_added',
        :like_count => Like.count,
        :image_id => "#{@image.id}"
    }.to_json

    response.body.should  eq(@json)
  end

  it 'create event if saved' do
    sign_in @user
    post :create, {:id => @image.id }
    expect{
      Event.create(:url => "images/#{@image.id}/", :user_id => @user.id, :event => 'like.create')
    }.to change(Event,:count).by(1)
  end

  it 'destroy' do
    sign_in @user
    FactoryGirl.create(:like, :user_id => @user.id, :image_id => @image.id)
    expect{ post :destroy, {:id => @image.id } }.to change(Like,:count).by(-1)
  end

  it 'if destroy success' do
    sign_in @user
    FactoryGirl.create(:like, :user_id => @user.id, :image_id => @image.id)
    post :destroy, {:id => @image.id }

    @json = {
        :status => 'success_deleted',
        :like_count => Like.count,
        :image_id => "#{@image.id}"
    }.to_json

    response.body.should  eq(@json)
  end

  it 'create event if destroy' do
    sign_in @user
    FactoryGirl.create(:like, :user_id => @user.id, :image_id => @image.id)
    post :destroy, {:id => @image.id }
    expect{
      Event.create(:url => "images/#{@image.id}/", :user_id => @user.id, :event => 'like.destroy')
    }.to change(Event,:count).by(1)
  end

  it 'route create' do
    expect(:get => "images/#{@image.id}/like/").to route_to(:action => 'create', :controller => 'likes', :id => "#{@image.id}")
  end

  it 'route destroy' do
    expect(:get => "images/#{@image.id}/dislike/").to route_to(:action => 'destroy', :controller => 'likes', :id => "#{@image.id}")
  end

end


#    ActiveSupport::Notifications.instrument('likes.create', :user_id => current_user.id, :url => request.fullpath)
#
#    ActiveSupport::Notifications.instrument('likes.destroy', :user_id => current_user.id, :url => request.fullpath)

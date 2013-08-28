require 'spec_helper'

describe SubscribesController do

  before do
    @category = FactoryGirl.create(:category)
    @user = FactoryGirl.create(:user)
  end

  it 'authenticate_user?' do
    post :create, {:title => @category.title }
    response.should redirect_to('http://test.host/users/sign_in')
  end

  it 'create' do
    sign_in @user
    expect{ post :create, {:title => @category.title } }.to change(Subscribe,:count).by(1)
  end

  it 'if saved' do
    sign_in @user
    post :create, {:title => @category.title }

    @json = {
        :stat => 'sub_succ',
        :category => @category.title,
    }.to_json

    response.body.should  eq(@json)
  end

  it 'create event if saved' do
    sign_in @user
    post :create, {:title => @category.title }
    expect{
      Event.create(:url => "#{@category.title}", :user_id => @user.id, :event => 'subscribe')
    }.to change(Event,:count).by(1)
  end

  it 'destroy' do
    sign_in @user
    FactoryGirl.create(:subscribe, :user_id => @user.id, :category_id => @category.id)
    expect{ post :destroy, {:title => @category.title } }.to change(Subscribe,:count).by(-1)
  end

  it 'if destroy success' do
    sign_in @user
    FactoryGirl.create(:subscribe, :user_id => @user.id, :category_id => @category.id)
    post :destroy, {:title => @category.title}

    @json = {
        :stat => 'sub_deleted',
        :category => @category.title,
    }.to_json

    response.body.should  eq(@json)
  end

  it 'create event if destroy' do
    sign_in @user
    FactoryGirl.create(:subscribe, :user_id => @user.id, :category_id => @category.id)
    post :destroy, {:title => @category.title}
    expect{
      Event.create(:url => "#{@category.title}", :user_id => @user.id, :event => 'unsubscribe')
    }.to change(Event,:count).by(1)
  end

  it 'route create' do
    expect(:get => "/subscribe/#{@category.title}").to route_to(:action => 'create', :controller => 'subscribes', :title => "#{@category.title}")
  end

  it 'route destroy' do
    expect(:get => "/unsubscribe/#{@category.title}").to route_to(:action => 'destroy', :controller => 'subscribes', :title => "#{@category.title}")
  end

end
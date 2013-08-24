require 'spec_helper'

describe CommentsController do

  before :each do
    @category = FactoryGirl.create(:category)
    @user = FactoryGirl.create(:user)
    @image = FactoryGirl.create(:image)

  end

  describe 'routes' do

    it 'route to #new' do
      expect(:GET => '/images/1/comments/new').to route_to(:controller => 'comments', :action => 'new', :image_id => '1')
    end

    it 'route to #create' do
      expect(:POST => '/images/1/comments').to route_to(:controller => 'comments', :action => 'create', :image_id => '1')
    end

  end

  describe 'methods' do

    it 'authenticate_user?' do
      post :create, {:image_id => 1, :comment => {:description => 'simple text'} }
      response.should redirect_to('http://test.host/users/sign_in')
    end

    it 'create' do
      sign_in @user
      expect{
        FactoryGirl.create(:comment, :user_id => @user.id, :description => 'simple text', :image_id => '1')
      }.to change(Comment,:count).by(1)
    end

    it 'if saved' do
      sign_in @user
      post :create, {:image_id => @image.id, :comment => { :description => 'comment' } }
      expect{
        Event.create(:url => 'images/1/comments', :user_id => '1', :event => 'comment.create')
      }.to change(Event,:count).by(1)

      @comment = Comment.last
      @json = {
          :comment  => @comment,
          :name     => @user.name,
          :stat    => 'succ',
          :location => @image
      }.to_json

      response.body.should  eq(@json)
    end

    #it 'if not saved' do
    #  post :create, {:image_id => @image.id }
    #  @json = {
    #      :error  => @comment,
    #      :name     => @user.name,
    #      :stat    => 'succ',
    #      :location => @image
    #  }.to_json
    #end                      Проверь здесь неудачную отправку коммента, точнее рендер jsona при провале

  end

end

#if @comment.save
#  ActiveSupport::Notifications.instrument('comment.create', :user_id => current_user.id, :url => request.fullpath)
#  render json: {:comment => @comment, :name => current_user.name ,:stat => 'succ', :location => @image }
#else
#  render json: {:error => @comment.errors.messages, :stat => 'error' }
#end
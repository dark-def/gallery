require 'spec_helper'

describe ImagesController do

  before do
    @cat, @img, @com, @usr = Hash.new
    @img = { :image => FactoryGirl.create(:image) }
    3.times do
      @usr = { :user => FactoryGirl.create(:user) }
      @com = { :comment => FactoryGirl.create(:comment, :image_id => '1') }
      @cat = { :category => FactoryGirl.create(:category) }
    end
    @category = Category.last
    @image = FactoryGirl.create(:image, :category_id => @category.id)
    @user = FactoryGirl.create(:user)
    @comment = FactoryGirl.create(:comment, :image_id => @image.id)
  end

  describe 'GET categories' do

    it 'returns http success' do
      expect(:get => 'categories').to route_to(:action => 'categories', :controller => 'images')
      response.should be_success
    end

    it 'render' do
      get :categories
      response.should render_template :categories
      assert_template layout: "layouts/application"
    end

  end

  describe 'GET show' do

    it 'returns http success' do
      expect(:get => "images/#{@image.id}").to route_to(:action => 'show', :controller => 'images', :id => "#{@image.id}")
      response.should be_success
    end

    it 'render' do
      get :show, id: @image.id
      response.should render_template :show
      assert_template layout: "layouts/application"
    end

  end

  describe 'GET show_categories' do

    it 'returns http success' do
      expect(:get => "/#{@category.title}").to route_to(:action => 'show_categories', :controller => 'images', :category => "#{@category.title}")
      response.should be_success
    end

    it 'render' do
      get :show_categories, :category => @category.title
      response.should render_template :show_categories
      assert_template layout: "layouts/application"
    end

  end

  describe 'GET all' do

    it 'returns http success' do
      expect(:get => 'all').to route_to(:action => 'all', :controller => 'images')
      response.should be_success
    end

    it 'render' do
      get :all
      response.should render_template :all
      assert_template layout: "layouts/application"
    end

  end

  describe 'check object Categories' do
    it { @cat.should be_instance_of(Hash) }
    it { @cat.should_not be_nil }
    it { @cat.should have_at_least(1).items }
  end

  describe 'check object Image' do
    it { @img.should be_instance_of(Hash) }
    it { @img.should_not be_nil }
    it { @img.should have(1).items }
  end

  describe 'check object Comment' do
    it { @com.should be_instance_of(Hash) }
    it { @com.should_not be_nil }
    it { @com.should have_at_least(1).items }
  end

  describe 'check object User' do
    it { @usr.should be_instance_of(Hash) }
    it { @usr.should_not be_nil }
    it { @usr.should have_at_least(1).items }
  end

end


#class ImagesController < ApplicationController
#
#  def all
#    @images = Image.includes(:comments,:likes).order("created_at DESC").page(params[:page]).per(5)
#  end
#
#
#end

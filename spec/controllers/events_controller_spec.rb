require 'spec_helper'

describe EventsController do

  before do
    @usr, @events = Hash.new
    3.times do
       @events = {:event => FactoryGirl.create(:event) }
       @usr = {:user => FactoryGirl.create(:user) }
    end
    @user = FactoryGirl.create(:user)
  end

  describe 'index' do

    it 'returns http success' do
      expect(:get => '/events').to route_to(:action => 'index', :controller => 'events')
      response.should be_success
    end

    it 'render' do
      get :index
      response.should render_template :index
      assert_template layout: "layouts/application"
    end

  end

  describe 'show' do

    it 'returns http success' do
      expect(:get => "/events/all/#{@user.id}").to route_to(:controller => 'events', :action => 'show', :type => 'all', :id => "#{@user.id}")
      response.should be_success
    end

    it 'render' do
      get :show, :type => 'all', :id => @user.id
      response.should render_template :show
      assert_template layout: "layouts/application"

    end

  end

  describe 'check object User' do
    it { @usr.should be_instance_of(Hash) }
    it { @usr.should_not be_nil }
    it { @usr.should have_at_least(1).items }
  end

  describe 'check object Event' do
    it { @events.should be_instance_of(Hash) }
    it { @events.should_not be_nil }
    it { @events.should have_at_least(1).items }
  end

end
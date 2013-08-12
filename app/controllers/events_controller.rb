class EventsController < ApplicationController

  def index
     @users = User.includes(:events).all
  end

  def show
    if params[:type]
      type = params[:type]
    end
    @user = User.find(params[:id])
    @events = Event.where(:user_id => @user.id, :event => type)
  end

end

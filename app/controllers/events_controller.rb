class EventsController < ApplicationController

  def index
     @users = User.includes(:events).all
  end

  def show
    if params[:type]
      type = params[:type]
    end
    @user = User.find(params[:id])
    if type == 'all'
      @events = Event.where(:user_id => @user.id)
    elsif type == 'comment'
      @events = Event.where(:user_id => @user.id, :event => 'comment.create')
    elsif type == 'likes'
      @events = Event.where("event = 'likes.create' OR event = 'likes.destroy'")
      #@events = Event.where(:user_id => @user.id, :event => 'likes.create')
    else
      @events = Event.where(:user_id => @user.id, :event => type)
    end
  end

end
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
    else
      @events = Event.where(:user_id => @user.id, :event => type)
    end
  end

  def graphs
    @sign_in = Event.where(:event => 'sign_in').order('created_at ASC').to_json
    logger.info '*'*100
    logger.info @sign_in
    logger.info '*'*100

    render :graphs
    #render :json => { :sign_in => @sign_in }
    #respond_to do |format|
      #format.html { render :graphs }
      #format.json { render json: { :sign_in => @sign_in } }
    #end

  end

end

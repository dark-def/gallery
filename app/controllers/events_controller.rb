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

  end

  def get_visit_graphs
    @sign_in =  Event.where("event = 'sign_in'").select("date(created_at) as ordered_date, count(event) as total_number").group("date(created_at)").order("ordered_date ASC")
    @likes =  Event.where("event = 'likes.create'").select("date(created_at) as ordered_date, count(event) as total_number").group("date(created_at)").order("ordered_date ASC")
    @comment =  Event.where("event = 'comment.create'").select("date(created_at) as ordered_date, count(event) as total_number").group("date(created_at)").order("ordered_date ASC")
    @subscribes =  Event.where("event = 'subscribe'").select("date(created_at) as ordered_date, count(event) as total_number").group("date(created_at)").order("ordered_date ASC")
    render :json => { :sign_in => @sign_in, :likes => @likes, :comment => @comment, :subscribes => @subscribes}
  end

  def get_counter_graph
    @likes_create = Event.where(:event => 'likes.create').count
    @likes_destroy = Event.where(:event => 'likes.destroy').count
    @comments = Event.where(:event => 'comment.create').count
    @sign_in = Event.where(:event => 'sign_in').count
    @sign_out = Event.where(:event => 'sign_out').count
    @subscribe = Event.where(:event => 'subscribe').count
    @unsubscribe = Event.where(:event => 'unsubscribe').count
    @click_link = Event.where(:event => 'Click on link').count

    render :json => { :likes_create => @likes_create,
                      :likes_destroy => @likes_destroy,
                      :comments => @comments,
                      :sign_in => @sign_in,
                      :sign_out => @sign_out,
                      :subscribe => @subscribe,
                      :unsubscribe => @unsubscribe,
                      :click_link => @click_link }
  end

  def get_circle_graphs
    data = Array.new
    @categories = Category.all

    @categories.each do |cat|
      img_size = cat.images.size

      comments_count = 0
      cat.images.each do |img|
        comments_count += img.comments.size
      end

      likes_count = 0
      cat.images.each do |img|
        likes_count += img.likes.size
      end

      data[cat.id] = {:category => cat.title, :img_size => img_size , :comments_size => comments_count, :likes_size => likes_count}
    end
    render :json => {:data => data.compact}

  end

end

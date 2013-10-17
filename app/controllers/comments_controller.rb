class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  def new
    @comment = current_user.comments.build
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build
    @comment.image_id = @image.id
    @comment.user_id = current_user.id
    @comment.description = params[:comment][:description]

    if @comment.save
      ActiveSupport::Notifications.instrument('comment.create', :user_id => current_user.id, :url => request.fullpath)
      render json: {:comment => @comment, :email => Digest::MD5.hexdigest(current_user.email), :name => current_user.name ,:stat => 'succ', :location => @image }
    else
      render json: {:error => @comment.errors.messages, :stat => 'error' }
    end

  end
end
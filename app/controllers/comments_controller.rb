class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  #def new
  #  @comment = current_user.comments.build
  #end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.build
    @comment.image_id = @image.id
    @comment.user_id = current_user.id
    #@comment.description = params[:description]

    if @comment.save
      render json: {:comment => @comment, :stat => 'succ', :location => @image }
    else
      render json: {:error => @comment.errors.messages, :stat => 'error' }
    end

  end
end

class CommentController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  def new
    @comment = current_user.comments.new
  end

  def create
  end
end

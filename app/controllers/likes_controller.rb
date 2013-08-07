class LikesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]

  def create
    image_id = params[:id]
    @like = current_user.likes.build
    @like.user_id = current_user.id
    @like.image_id = params[:id]
    if @like.save
      like_count = Image.find(params[:id]).likes.count
      render :json => {:status => 'success_added', :like_count => like_count, :image_id => image_id }
    end
  end

  def destroy
    image_id = params[:id]
    like = current_user.likes.where("image_id = #{params[:id]}")
    if !like.blank?
      like.delete_all
      like_count = Image.find(params[:id]).likes.count
      render :json => {:status => 'success_deleted', :like_count => like_count, :image_id => image_id }
    else
      render :json => {}
    end

  end


end
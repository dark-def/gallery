class LikesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]

  def create
    @like = current_user.likes.build
    @like.user_id = current_user.id

    @like.image_id = params[:id]
    if @like.save
      render :json => {:status => 'success_added' }
    end
  end

  def destroy
    like = current_user.likes.where("image_id = #{params[:id]}")
    logger.info '='*100
    logger.info like.inspect
    logger.info params.inspect
    logger.info '='*100
    if !like.blank?
      like.delete_all
      render :json => {:status => 'success_deleted'}
    end
  end

end
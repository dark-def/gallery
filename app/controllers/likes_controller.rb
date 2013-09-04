class LikesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create

    ActiveSupport::Notifications.instrument('likes.create', :user_id => current_user.id, :url => request.fullpath)

    image = Image.where(:id => params[:id]).first
    @like = Like.create(:user_id => current_user.id, :image_id => image.id)
    if @like.save
      like_count = image.likes.count
      render :json => {:status => 'success_added', :like_count => like_count, :image_id => image.id }
    end
  end

  def destroy

    ActiveSupport::Notifications.instrument('likes.destroy', :user_id => current_user.id, :url => request.fullpath)

    image = Image.where(:id => params[:id]).first
    like = current_user.likes.where(:image_id => image.id)
    if !like.blank?
      image.likes.where(:user_id => current_user.id).destroy_all
      like_count = image.likes.count
      render :json => {:status => 'success_deleted', :like_count => like_count, :image_id => image.id }
    else
      render :json => {}
    end

  end


end
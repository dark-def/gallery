class RatingsController < ApplicationController

  def create

    image = Image.where(:id => params[:id]).first
    rate = Rating.create(:user_id => current_user.id, :image_id => image.id, :mark => params[:mark])
    if rate.save
      ActiveSupport::Notifications.instrument('likes.create', :user_id => current_user.id, :url => request.fullpath)
      render :json => {:status => 'success_rated', :image_id => image.id }
    end
  end

end

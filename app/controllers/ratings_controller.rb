class RatingsController < ApplicationController

  def create

    image = Image.where(:id => params[:id]).first
    rate = Rating.create(:user_id => current_user.id, :image_id => image.id, :mark => params[:mark])
    if rate.save
      ActiveSupport::Notifications.instrument("rate - #{params[:mark]}", :user_id => current_user.id, :url => request.fullpath)
      rating = image.ratings.average('mark').round 1
      Image.update(image.id, :rating => rating )

      render :json => {:status => 'success_rated', :image_id => image.id, :rating => rating }
    end
  end

end

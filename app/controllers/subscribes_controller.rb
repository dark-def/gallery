class SubscribesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create

    category = Category.where(:title => params[:title]).first
    @subscribe = Subscribe.new
    @subscribe.category_id = category.id
    @subscribe.user_id = current_user.id
    if @subscribe.save
      ActiveSupport::Notifications.instrument('subscribe', :user_id => current_user.id, :category => category.title )
      render :json => {:stat => 'sub_succ', :category => category.title}
    end
  end

  def destroy
    category = Category.where(:title => params[:title]).first
    subscribe_unit = current_user.subscribes.where(:category_id => category)
    if subscribe_unit.delete_all
      ActiveSupport::Notifications.instrument('unsubscribe', :user_id => current_user.id, :category => category.title )
      render :json => {:stat => 'sub_deleted', :category => category.title}
    end

  end

end
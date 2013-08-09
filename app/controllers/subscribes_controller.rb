class SubscribesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create

    logger.info '='*150
    category = Category.where(:title => params[:title]).first
    logger.info '='*150
    #user_id = current_user.id
    @subscribe = Subscribe.new
    @subscribe.category_id = category.id
    @subscribe.user_id = current_user.id
    if @subscribe.save
      render :json => {:stat => 'sub_succ', :category => category.title}
      #redirect_to show_categories_path(category.title)
    end
  end

  def destroy
    category = Category.where(:title => params[:title]).first
    subscribe_unit = current_user.subscribes.where(:category_id => category)
    if subscribe_unit.delete_all
      render :json => {:stat => 'sub_deleted', :category => category.title}
    end

  end

end
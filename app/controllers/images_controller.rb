class ImagesController < ApplicationController

  def show
    session[:return_to] = request.fullpath
    @image = Image.find(params[:id])
    @comments = @image.comments.page(params[:page]).per(5)
    @user = User.all
  end

  def categories
    @category_last_image = Category.includes(:images).all
  end

  def show_categories
    @category = Category.where(:title => "#{params[:category]}").first
    @images = Image.where(:category_id => @category.id).order('created_at DESC').page(params[:page]).per(5)
  end

  def all
    @images = Image.order('likes_count DESC').page(params[:page]).per(5)
  end

  def all_comments
    @comments = Comment.includes(:user, :image).order("created_at DESC").all
  end

end

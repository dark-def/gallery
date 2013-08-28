class ImagesController < ApplicationController

  def show
    session[:return_to] = request.fullpath
    @categories = Category.all
    @image = Image.includes(:comments, :likes).find(params[:id])
    @comments = @image.comments.page(params[:page]).per(5)
    @user = User.all
  end

  def categories
    @category_last_image = Category.includes(:images).all
  end

  def show_categories
    @categories = Category.all
    @category = Category.where(:title => "#{params[:category]}").first
    @images = Image.includes(:comments, :likes).where(:category_id => @category.id).order('created_at DESC').page(params[:page]).per(5)
  end

  def all
    @images = Image.includes(:comments,:likes).order("created_at DESC").page(params[:page]).per(5)
  end


end

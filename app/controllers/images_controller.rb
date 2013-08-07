class ImagesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    session[:return_to] = request.fullpath
    @categories = Category.all
    @image = Image.find(params[:id])
    @comments = @image.comments.page(params[:page]).per(5)
    @user = User.all
  end

  def categories
    @category_last_image = Category.includes(:images).all
    #@cat = category.inject({}) { |res, elem| res[elem.images.last] ||= []; res[elem.images.last.title]; res  }.to_a
  end

  def show_categories
    @categories = Category.all
    category = Category.where(:title => "#{params[:category]}").first
    @images = Image.where(:category_id => category.id).page(params[:page]).per(5)
  end

end

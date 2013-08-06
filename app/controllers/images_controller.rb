class ImagesController < ApplicationController
  def index
    @categories = Category.all
    @images = Image.all
  end

  def show

    @categories = Category.all
    @image = Image.find(params[:id])
    @comments = @image.comments.page(params[:page]).per(5)
    #render :text => 'RENDERRED OK'
  end

  def show_categories
    @categories = Category.all

    category = Category.where(:title => "#{params[:category]}").first
    @images = Image.where(:category_id => category.id).page(params[:page]).per(5)

    #@images = Image.all
    #category = Category.find(params[:title])
    #@images = Image.category.id.all
    #@images = Image.joins(:categories).where("category = #{params[:category]}")
    #@images = Category.joins(:images).where("")
  end
end

class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
    @image_last_id = Image.last.id
    @image_first_id = Image.first.id
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
    if params[:sort_by] == 'by_comments'
      @images = Image.order('comments_count DESC').page(params[:page]).per(5)
    elsif params[:sort_by] == 'by_likes'
      @images = Image.order('likes_count DESC').page(params[:page]).per(5)
    else
      @images = Image.order('rating ASC').page(params[:page]).per(5)  # нужно поменять порядок(выбирает сначала с меньшим рейтингом)
    end
  end

  def all_comments
    @comments = Comment.includes(:user, :image).order("created_at DESC").all
  end




end

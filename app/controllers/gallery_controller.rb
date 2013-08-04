class GalleryController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @images = Image.find(params[:id])
    render :text => 'RENDERRED OK'
  end
end

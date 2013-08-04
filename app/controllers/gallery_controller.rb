class GalleryController < ApplicationController
  def index
    @images = Image.all
  end

  def show
  end
end

ActiveAdmin.register Image do

  index do
    column :id
    column :title
    column :category
    column :image do |img|
      image_tag(img.image.url, height: 15)
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :category
      f.input :image
    end
    f.actions
  end

  controller do

    def new
      @image = Image.new
      logger.info 'GGGGggggurda'*100
    end

    def create
      @image = Image.new
      @image.category_id = params[:image][:category_id]
      @image.image = params[:image][:image]
      @image.title = params[:image][:image].original_filename

      if @image.save
        redirect_to admin_image_path(@image), notice: 'image was successfully created.'
      else
        render :new
      end
    end

  end

end
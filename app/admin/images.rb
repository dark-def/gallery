ActiveAdmin.register Image do

  index do
    column :id
    column :title
    column :category
    default_actions
    column :image do |img|
      image_tag(img.image.url, height: 35)
    end
  end

  action_item do
    link_to 'Parse', root_path
  end

  form do |f|
    f.inputs "Details" do
      f.input :category
      f.input :image
    end
    f.actions
  end

  controller do

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
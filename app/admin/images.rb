ActiveAdmin.register Image do

  batch_action :flag do |selection|
    Image.find(selection).each do |img|
      img.flag! :hot
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :likes_count
    column :comments_count
    column 'category' do |img|
      img.category.title
    end
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

    def scoped_collection
      Image.includes(:category)
    end

    def new
      @image = Image.new
    end

    def create
      @image = Image.new
      @image.category_id = params[:image][:category_id]
      @image.image = params[:image][:image]
      @image.title = params[:image][:image].original_filename.truncate(50)

      if @image.save
        @user_subscribe = @image.category.users.pluck(:email)
        if !@user_subscribe.blank?
          SubscribeMailer.send_mail(@image, @image.category.title, @user_subscribe).deliver
        end
        redirect_to admin_image_path(@image), notice: 'image was successfully created.'
      else
        render :new
      end
    end

  end

end
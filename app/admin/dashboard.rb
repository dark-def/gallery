ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    @images = TmpImages.order('id DESC').all
    @categories = Category.all

    columns do
      column do
        panel "Auto Parsed images - #{@images.size} new images" do
          @images.each do |img|
            div :class => 'parsed_images' do

              div do
                image_tag img.image
              end

              div do
                render :partial => 'admin/form', :locals => {:img => img, :cat => @categories },:object => @categories
              end

            end

          end
        end
      end
    end

  end # content

  controller do

    def dash_save
      get_cat = Category.where(:title => params[:category_name]).first
      curl =  Curl.get(params[:image][:url])
      tempfile = Tempfile.new(Time.now.to_f.to_s)
      tempfile.write curl.body_str.force_encoding('utf-8')

      title = params[:image][:url].split("/").last.truncate(50)

      uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => title)
      @image = Image.create!(:image => uploaded_file, :category_id => get_cat.id, :title => title)
      @user_subscribe = @image.category.users.pluck(:email)
      if !@user_subscribe.blank?
        SubscribeMailer.send_mail(@image, @image.category.title, @user_subscribe).deliver
      end
      TmpImages.where(:image => "#{params[:image][:url]}").delete_all
      render :json => { :stat => 'succ' }, :layout => 'active_admin'
    end

    def delete
      TmpImages.find(params[:id]).delete
      render :json => { :stat => 'succ' }, :layout => 'active_admin'
    end

  end
end

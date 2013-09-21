ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    @images = TmpImages.all

    columns do
      column do
        panel 'Auto Parsed images' do
          @images.each do |img|
            div :class => "parsed_images" do

              #form do |f|
              #  f.inputs "Details" do
              #    f.input :title
              #    f.input :published_at, :label => "Publish Post At"
              #    f.input :category
              #  end
              #  f.inputs "Content" do
              #    f.input :body
              #  end
              #  f.actions
              #end


              #form_for Image.new, url: { action: 'save'}, :remote => true do |f|
              #  f.select_tag(:category_name, options_for_select(@categories.collect do |cat| [cat.title] end))
              #  f.hidden_field :url, :value => link
              #  f.submit "Add", :id => [index]
              #end
              image_tag img.image do

               end

               #= form_for Image.new, url: { action: 'save'}, :remote => true do |f|
               #  = f.select_tag(:category_name, options_for_select(@categories.collect do |cat| [cat.title] end))
               #  = f.hidden_field :url, :value => link
               #  = f.submit "Add", :id => [index]


               #.image-hover
               #.info_block
               #%i.icon-comments.icon-large
               #.font
               #= image.comments_count
               #%i.icon-heart.icon-large
               #.font
               #= image.likes_count
               #.image
               #= image_tag image.image.url(:thumb), :class => 'img-circle'

            end

            #img.image
            #image_tag img.image
          end
        end
      end
    end

  #content :title => proc{ I18n.t("active_admin.dashboard") } do
  #  div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #    span :class => "blank_slate" do
  #      span I18n.t("active_admin.dashboard_welcome.welcome")
  #      small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #    end
  #  end
  #
  #  # Here is an example of a simple dashboard with columns and panels.
  #  #
  #  columns do
  #     column do
  #       panel "Recent Posts" do
  #         ul do
  #           #Image.map do |image|
  #           #  li link_to(image.title, admin_post_path(image))
  #           #end
  #         end
  #       end
  #     end
  #
  #     column do
  #       panel "Info" do
  #         para "Welcome to ActiveAdmin."
  #       end
  #     end
  #  end
  #
  end # content

  controller do

    def save
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
      render :json => { :stat => 'succ' }, :layout => 'active_admin'
    end

  end
end

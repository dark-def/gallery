ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    @images = TmpImages.all

    columns do
      column do
        panel 'Auto Parsed images' do
          @images.each do |img|
            div :class => "parsed_images" do
               image_tag img.image

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
end

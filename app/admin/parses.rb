ActiveAdmin.register_page "Parse" do

  require 'nokogiri'
  require 'open-uri'

  page_action :steal, :method => :post do
    @categories = Category.all
    @images2 = Array.new

    doc = Nokogiri::HTML(open(params[:parse][:url]))

    doc.css("img").each_with_index do |item, index|
      @images2[index] = item['src']
    end
    @images = Kaminari.paginate_array(@images2).page(params[:page]).per(25)
    #@images.page(params[:page]).per(20)
    render :layout => 'active_admin'
  end


  #page_action :save_img, :method => :post do
  #
  #  render :json => {}, :layout => false
  #end
  action_item do
    link_to 'ADD', 'admin_parse_path'
  end








  content do
    semantic_form_for :parse, :builder => ActiveAdmin::FormBuilder do |f|
      f.inputs "Parse page" do
        f.input :url, :as => :string
      end
      f.actions
    end
  end

end #page
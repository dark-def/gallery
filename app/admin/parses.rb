ActiveAdmin.register_page "Parse" do

  require 'nokogiri'
  require 'open-uri'

  page_action :steal, :method => :post do

    @images = Array.new
    site = params[:parse][:url]

    doc = Nokogiri::HTML(open(site))

    doc.css("img").each_with_index do |item, index|
      @images[index] = item['src']
    end

    render :layout => 'active_admin'
  end

  page_action :save_img, :method => :post do

    render :json => {}, :layout => false
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
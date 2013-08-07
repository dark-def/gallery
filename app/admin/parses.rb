ActiveAdmin.register_page "Parse" do

  require 'nokogiri'
  require 'open-uri'

  page_action :steal, :method => :post do
    @images = Array.new
    site = params[:parse][:url]

    doc = Nokogiri::HTML(open(site))
    #url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=batman&Find.x=0&Find.y=0&Find=Find"
    #doc = Nokogiri::HTML(open(url))

    doc.css("img").each_with_index do |item, index|
      @images[index] = item['src']
    end

    #puts doc.at_css("title").text
    #doc.css(".item").each do |item|
    #  title = item.at_css(".prodLink").text
    #  price = item.at_css(".PriceCompare .BodyS, .PriceXLBold")
    #  puts "#{title} - #{price}"
    #  puts item.at_css(".prodLink")[:href]
    #end
    render :layout => 'active_admin'
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
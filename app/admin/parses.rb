ActiveAdmin.register_page "Parse" do

  require 'nokogiri'
  require 'open-uri'

  page_action :steal, :method => :post do
    @categories = Category.all
    @images = Array.new

    doc = Nokogiri::HTML(open(params[:parse][:url]))

    doc.css("img").each_with_index do |item, index|
      @images[index] = item['src']
    end
    #@images = Kaminari.paginate_array(@images2).page(params[:page]).per(25)
    #@images.page(params[:page]).per(20)
    render :layout => 'active_admin'
  end


  page_action :save, :method => :post do

    get_cat = Category.where(:title => params[:category_name]).first
    curl =  Curl.get(params[:image][:url])
    tempfile = Tempfile.new(Time.now.to_f.to_s)
    tempfile.write curl.body_str.force_encoding('utf-8')

    title = params[:image][:url].split("/").last

    uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => params[:image][:url].split("/").last)
    Image.create!(:image => uploaded_file, :category_id => get_cat.id, :title => title)

    render :json => { :stat => 'succ' }

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
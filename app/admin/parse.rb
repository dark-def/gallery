ActiveAdmin.register_page "Parse" do

  require 'nokogiri'
  require 'open-uri'

  page_action :steal, :method => :post do
    @categories = Category.all
    @images = Array.new

    doc = Nokogiri::HTML(open(params[:parse][:url]))

    doc.css("img").each_with_index do |item, index|
      var = item['src'].split('/').first.to_s                     # check for relative path
      if var == 'http:' || var == 'https:'                        # and don't write it to array
        @images[index] = item['src']
      end
    end
    @images = @images.compact                                   # delete all nil
    render :layout => 'active_admin'
  end


  page_action :save, :method => :post do

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

  content do
    semantic_form_for :parse, :builder => ActiveAdmin::FormBuilder do |f|
      f.inputs "Parse page" do
        f.input :url, :as => :string
      end
      f.actions
    end
  end

end #page
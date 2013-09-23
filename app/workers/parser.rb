class Parser

  @queue = :parse

  require 'nokogiri'
  require 'open-uri'

  redis = Redis.new(:port => '6379', :host => 'localhost')

  def self.perform()
    #prev_result = redis.get('prev_result')
    url = 'http://www.nastol.com.ua/tags/girl'
    @images = []
    doc = Nokogiri::HTML(open(url))
    doc.css('a').each_with_index do |item, index|                           # if image warp by 'a'
      begin
        var = item['href'].split('.')                                       # check for .jpg, .png
        if var.last == 'jpg' || var.last == 'jpeg' || var.last == 'png'     # and get it
          @images[index] = item['href']
        end
      rescue
        # if url haven't .format in the end
      end
    end
    doc.css('img').select{|img| img[:width].to_i > 200}.each_with_index do |item, index|
      domain = url.split('/')[0..2].join('/').to_s
      var = item['src'].split('/').first.to_s                     # check for relative path
      if var == 'http:' || var == 'https:'                        # and don't write it to array
        @images[index] = item['src']
      else
        @images[index] = "#{domain}#{(item['src'])}"              # if url is relative, join domain name to link
      end
    end

    @images = @images.uniq.compact                                     # delete all nil and left uniq images
    title = '123'
    @images.each do |tmp_img|
      p tmp_img.image
      TmpImages.create(:image => tmp_img, :title => title)
    end
    p 'Job os done!'

  end

end
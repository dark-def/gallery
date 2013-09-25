class Parser

  @queue = :parse

  require 'nokogiri'
  require 'open-uri'

  @redis = Redis.new(:port => '6379', :host => 'localhost')

  def self.perform()

    url = Hash.new
    url = {:link => 'http://www.nastol.com.ua/tags/%F1%E5%EA%F1%E8/',
          :link1 => 'http://www.nastol.com.ua/tags/girl/',
          :link2 => 'http://www.nastol.com.ua/tags/%ED%E8%E6%ED%E5%E5+%E1%E5%EB%FC%E5/',
          :link3 => 'http://www.nastol.com.ua/tags/%E2%E7%E3%EB%FF%E4/'}

    begin
      prev_result = @redis.hgetall('prev_result')
    rescue
      @redis.hset('prev_result' , '0', '')
      prev_result = @redis.hgetall('prev_result')
    end

    p '-'*100
    p "Prev result = #{prev_result}"
    p '-'*100
    #url = 'http://www.nastol.com.ua/devushki/60886-blonde-girl-cute.html'
    @images = []

    url.each do |i, url|
      p url

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

      prev_result.each do |key, value|
        @images.each do |key2, value2|
          if key2 == value
            @images.delete(key2)
          end
        end
      end
      p '-'*100
      p 'Images added:'
      @images.each_with_index do |tmp_img, index|
        p tmp_img
        @redis.hset('prev_result', "#{index}-#{i}", "#{tmp_img}")
        TmpImages.create(:image => tmp_img)
      end
      p '-'*100

      p 'Job os done!'
    end

  end

end
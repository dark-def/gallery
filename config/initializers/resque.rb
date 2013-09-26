uri = URI.parse('redis://localhost:6379/')
#uri = URI.parse('redis://redistogo:cffe4964ff031b5b67e70cad6038b014@tarpon.redistogo.com:9758/ ')
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }

require 'resque_scheduler'
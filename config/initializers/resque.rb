uri = URI.parse('redis://localhost:6379/')
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }

require 'resque_scheduler'
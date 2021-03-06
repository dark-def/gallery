source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'

gem 'resque', :require => 'resque/server'
gem 'resque-scheduler', :require => 'resque_scheduler'

group :assets do

  gem 'font-awesome-rails'
  gem 'less-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails-bootstrap', '~> 3.0.0.wip', github: 'sinfin/less-rails-bootstrap-3'

end
gem 'hirb'
gem 'therubyracer'
gem 'gon'
gem 'rabl-rails'
gem 'jquery-rails', '~> 2.3.0'
gem 'bootstrap-sass'
gem 'devise'
gem 'haml-rails'
gem 'haml'
gem 'pg'
gem 'simple_form'
gem 'carrierwave'
gem 'kaminari'
gem 'omniauth-facebook'
gem 'nokogiri'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'curb'
gem 'simple_captcha', :git => 'git://github.com/galetahub/simple-captcha.git'
gem 'pusher'
gem 'rmagick'
gem 'annotate', '>=2.5.0'

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'puma'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :production do
  gem 'unicorn-rails'
end

group :test do
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
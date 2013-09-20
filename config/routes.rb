Gallery::Application.routes.draw do

  root :to => 'images#index'

  get '/all_comments' => 'images#all_comments', :as => :show_all_comments # почему-то снизу он не работает :O
  get '/categories' => 'images#categories', :as => :categories   # почему-то снизу он не работает :O
  get '/auth/:provider/callback' => 'authentications#create' # For socials networks
  get '/auth/destroy' => 'authentications#destroy'

  post 'admin/parse' => 'admin/parse#steal' # For parsing
  post 'admin/parse/save' => 'admin/parse#save', :as => :parsed_save # For parsing

  get '/images/:id/dislike' => 'likes#destroy', :as => :i_dont_like_this
  get '/images/:id/like' => 'likes#create', :as => :i_like_this

  get '/images/:id/:mark' => 'ratings#create', :as => :rate_this     #rating

  get '/subscribe/:title' => 'subscribes#create', :as => :subscribe
  get '/unsubscribe/:title' => 'subscribes#destroy', :as => :unsubscribe

  get '/events/' => 'events#index', :as => :events
  get '/events/graphs' => 'events#graphs', :as => :graphs
  post '/events/get_visit_graphs' => 'events#get_visit_graphs', :as => :get_visit_graphs
  post '/events/get_counter_graph' => 'events#get_counter_graph', :as => :get_counter_graph
  post '/events/get_circle_graphs' => 'events#get_circle_graphs', :as => :get_circle_graphs
  get '/events/:type/:id' => 'events#show', :as => :show_type


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registration => 'registrations',:sessions => 'sessions'}

  resources :images, only: [:show] do
    resources :comments, only: [:new, :create]
  end

  get '/all/:sort_by' => 'images#all', :as => :show_all
  get '/categories/:category' => 'images#show_categories', :as => :show_categories

  unless Rails.application.config.consider_all_requests_local              #  404
    get '*not_found', to: 'errors#error_404'                               #  500
  end                                                                      #  custom pages

  authenticate :admin_user do
    mount Resque::Server.new, :at => "/resque"
  end


end
Gallery::Application.routes.draw do

  get '/categories' => 'images#categories', :as => :categories   # почему-то снизу он не работает :O
  get '/auth/:provider/callback' => 'authentications#create' # For socials networks
  get '/auth/destroy' => 'authentications#destroy'

  post 'admin/parse' => 'admin/parse#steal' # For parsing
  get 'admin/parse/save' => 'admin/parse#save', :as => :parsed_save # For parsing

  get '/subscribe/:title' => 'subscribes#create', :as => :subscribe
  get '/unsubscribe/:title' => 'subscribes#destroy', :as => :unsubscribe

  get '/events/' => 'events#index', :as => :events
  get '/events/:type/:id' => 'events#show', :as => :show_type
  #get '/events/all/:id' => 'events#show', :as => :events_all
  #get '/events/navigation/:id' => 'events#show', :as => :events_navigation
  #get '/events/sign_in/:id' => 'events#show', :as => :events_sign_in
  #get '/events/sign_out/:id' => 'events#show', :as => :events_sign_out
  #get '/events/likes/:id' => 'events#show', :as => :events_likes
  #get '/events/comments/:id' => 'events#show', :as => :events_comments

  root :to => 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:registrations => 'registrations',:sessions => 'sessions'}
  #resources :subscribe, only: [:create, :destroy]
  resources :images, only: [:index, :show, :categories, :show_categories] do
    resources :comments, only: [:new, :create]
    #resources :likes, only: [:create, :destroy]
  end

  get '/all' => 'images#all', :as => :show_all
  get '/images/:id/dislike' => 'likes#destroy', :as => :i_dont_like_this
  get '/images/:id/like' => 'likes#create', :as => :i_like_this
  get '/:category' => 'images#show_categories', :as => :show_categories

end
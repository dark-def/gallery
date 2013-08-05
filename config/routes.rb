Gallery::Application.routes.draw do

  get "comment/new"

  get "comment/create"

  root :to => 'gallery#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  resources :gallery, only: [:index, :show, :show_categories] do
    #get 'category/show_categories', :action => :show_categories, :as => :show_categories
  end

  #get '/auth/:provider/callback' => 'facebook#create'
  get '/:category' => 'gallery#show_categories', :as => :show_categories
end


#resources :gallerIES, only: [:index, :show, :show_categories] do
#  post 'galeries/show_categories', :action => :show_categories, :as => :show_categories
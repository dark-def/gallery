Gallery::Application.routes.draw do

  #get "comment/new"
  #
  #get "comment/create"

  root :to => 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
 # ActiveAdmin.routes(self)

  resources :images, only: [:index, :show, :show_categories] do
    resources :comments, only: [:new, :create]
  end

  get '/:category' => 'images#show_categories', :as => :show_categories
end


#resources :gallerIES, only: [:index, :show, :show_categories] do
#  post 'galeries/show_categories', :action => :show_categories, :as => :show_categories
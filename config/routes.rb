Gallery::Application.routes.draw do

  get '/auth/:provider/callback' => 'authentications#create' # For socials networks
  get '/auth/destroy' => 'authentications#destroy'

  root :to => 'images#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :images, only: [:index, :show, :show_categories] do
    resources :comments, only: [:new, :create]
  end

  get '/:category' => 'images#show_categories', :as => :show_categories

end
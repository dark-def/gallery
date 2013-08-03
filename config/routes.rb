Gallery::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  ActiveAdmin.routes(self)

  get "gallery/index"
  get "gallery/show"

  root :to => 'gallery#index'

end

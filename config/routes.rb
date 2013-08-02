Gallery::Application.routes.draw do

  get "gallery/index"
  get "gallery/show"

  root :to => 'gallery#index'

end

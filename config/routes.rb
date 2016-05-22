Rails.application.routes.draw do


  devise_for :users
  resources :stories do
  	resources :reviews
  end
  root 'stories#index'

end

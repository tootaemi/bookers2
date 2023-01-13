Rails.application.routes.draw do
  get 'home/index'

root to: 'homes#top'
get "home/about" => "home#about", as: "about"


devise_for :users

 resources :users
 resources :books

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 end

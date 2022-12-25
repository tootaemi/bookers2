Rails.application.routes.draw do
 
 root to: 'homes#top'
 get "/homes/about" => "homes#about", as: "about"
 
 devise_for :users
 
 resources :users, only: [:index,:show,:edit,:update,:create,:destroy, :new]
 resources :books, only: [:index,:show,:edit,:update,:create,:destroy, :new]
 
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
 end

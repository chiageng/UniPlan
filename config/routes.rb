Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#home'

  resources :todolists
  get "signup", to: "users#new"

  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :messages
  resources :chats
  resources :forums do 
    resources :comments
  end 
end

Rails.application.routes.draw do
  resources :articles
 
  root "pages#home"
  get "about" , to:"my_first#about"
  get "signup" , to:"users#signup"
  get "login" , to:"sessions#new"
  post "login", to:"sessions#create"
  delete "logout", to:"sessions#destroy"
  resources :users
  resources :categories, except: [:destroy]
end

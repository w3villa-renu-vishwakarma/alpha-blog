Rails.application.routes.draw do
  resources :articles
 
  root "my_first#home"
  get "about" , to:"my_first#about"
end

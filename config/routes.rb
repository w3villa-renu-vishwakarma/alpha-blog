Rails.application.routes.draw do
 
  root "my_first#home"
  get "about" , to:"my_first#about"
end

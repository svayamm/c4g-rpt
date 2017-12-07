Rails.application.routes.draw do
  resources :finances
  resources :crops
  resources :farms
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "result"=> "pages#show"
  
  
end

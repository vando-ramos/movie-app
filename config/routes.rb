Rails.application.routes.draw do
  root "home#index"

  resources :genres
  resources :directors
  resources :movies
end

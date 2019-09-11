Rails.application.routes.draw do
  resources :cryptos
  resources :users
  resources :exchanges
  resources :login, only: [:new, :create]
  get "/users/:id/portfolio", to: "users#portfolio", as: "portfolio"
  get "/", to:"login#new"
  delete "/logout", to: "login#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
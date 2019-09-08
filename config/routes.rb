Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard"

  #resources :users, only: [:create] DEVISE SHOULD DO IT FOR US
  resources :bookings, only: [:show]
  resources :geeks do
    resources :bookings, only: [:create]
  end
end

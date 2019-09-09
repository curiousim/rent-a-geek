Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard"

  # resources :geeks, only: [ :index, :show, :new, :create, :destroy ] do
  #   resources :bookings, only: [ :new, :create ]
  #   resources :reviews, only: [ :new, :create ]
  # end
  # resources :bookings, only: [ :destroy ]
  # resources :reviews, only: [ :destroy ]

  #resources :users, only: [:create] DEVISE SHOULD DO IT FOR US
  resources :bookings, only: [:show]
  resources :geeks do
  resources :bookings, only: [:create]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: "pages#dashboard"
  get "add_review/:id", to: "bookings#add_review", as: :add_review

  resources :bookings, only: [:show, :update, :destroy]
  resources :geeks do
    resources :bookings, only: [:create, :show]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :droids, only: %i[show index create new] do 
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy]
end

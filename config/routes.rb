Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :droids, only: %i[show index create new]
  resources :bookings, only: %i[index create new update edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

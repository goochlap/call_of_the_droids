Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'pages#home'

  resources :droids, only: %i[show index create new destroy] do
    resources :bookings, only: %i[new index create]
  end

  resources :users, only: %i[new create show] do
    resources :bookings, only: %i[destroy index]
  end
end

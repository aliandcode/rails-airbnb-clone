Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'houses#index'

  resources :houses do
    resources :bookings, only: %i[show new create]
  end

  resources :bookings, only: :index
end

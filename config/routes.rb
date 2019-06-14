Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'houses#index'

  resources :houses, only: [:index, :show, :new, :create] do
    resources :bookings, only: %i[show new create]
  end

  resources :bookings, only: :index do
    resources :reviews, only: :create
  end

  resources :users, only: %i[new create]

  # still need to disallow all the other pages routes
  resources :pages do
    collection do
      get 'dashboard'
    end
  end

  patch "bookings/:id/approve", to: "bookings#approve", as: 'booking_approve'
  patch "bookings/:id/reject", to: "bookings#reject", as: 'booking_reject'

end

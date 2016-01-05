Rails.application.routes.draw do
  get 'pages/features' => 'high_voltage/pages#show', id: 'features'

  # scope '(:locale)', locale: /en|es/ do


    devise_for :users

    resources :booking_confirmations, only: [:show]

    resources :restaurants do
      resources :bookings
      resources :customers, only: [:index, :show, :new, :create, :edit, :update]
      resources :comments, only: [:create, :destroy]
      # resources :waiters
      # resources :spots
      # resources :agenda, only: [:show]

      resource :settings, only: [:edit, :update]
      # resource :notifications, only: [:update]

      namespace :settings do
        resources :spots
        resources :waiters
      end

      resource :stats, only: [:show]
    end
  # end
end

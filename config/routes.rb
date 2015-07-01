Rails.application.routes.draw do

  devise_for :users

  resources :restaurants do
    resources :waiters
    resources :spots
    resources :bookings

  end

  resources :customers, only: [:index, :show, :new, :create, :edit, :update]

end

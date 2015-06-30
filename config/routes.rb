Rails.application.routes.draw do

  resources :restaurants do
    resources :waiters
    resources :bookings
  end

  resources :customers, only: [:index, :show, :new, :create, :edit, :update]

  devise_for :users

end

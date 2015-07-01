Rails.application.routes.draw do
  resources :restaurants do
    resources :waiters
    resources :bookings
    # resources :agenda, only: [:show]
  end

  resources :customers, only: [:index, :show, :new, :create, :edit, :update]

  devise_for :users

end

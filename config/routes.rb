Rails.application.routes.draw do


  get 'settings/index'

  get 'settings/edit'

  get 'settings/update'

  devise_for :users

  resources :restaurants do
    resources :waiters
    resources :spots
    resources :bookings
    resources :customers, only: [:index, :show, :new, :create, :edit, :update]
    # resources :agenda, only: [:show]
  end



end

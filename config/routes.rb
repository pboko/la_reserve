Rails.application.routes.draw do

  resources :customers, only: [:index, :show, :new, :create, :edit, :update]

  devise_for :users
end

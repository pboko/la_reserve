Rails.application.routes.draw do

resources :restaurants do
  resources :bookings
  end
  devise_for :users
end

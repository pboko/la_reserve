Rails.application.routes.draw do

  devise_for :users

  resources :restaurants do
    resources :waiters
    resources :spots
  end

end

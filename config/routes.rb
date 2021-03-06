Rails.application.routes.draw do
  
  devise_for :users
  root to: "lessons#index"
  resources :lessons do
    resources :orders, only: [:index,:create]
    resources :messages, only: [:new,:create]

  end
  resources :users, only: [:show]
end
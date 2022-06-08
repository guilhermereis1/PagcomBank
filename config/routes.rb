Rails.application.routes.draw do
  resources :transfers
  resources :withdraws
  resources :deposits
  resources :accounts
  get 'dashboard/index'
  devise_for :users
  root to: "dashboard#index"
end

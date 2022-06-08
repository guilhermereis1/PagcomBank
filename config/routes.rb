Rails.application.routes.draw do
  resources :accounts
  get 'dashboard/index'
  devise_for :users
  root to: "dashboard#index"
end

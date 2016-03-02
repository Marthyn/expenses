Rails.application.routes.draw do
  devise_for :users
  resources :categories, except: [:show]
  resources :expenses
  resources :shops, except: [:show]
  root "home#index"
end

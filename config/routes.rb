Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :categories, except: [:show]
  resources :expenses
  resources :shops, except: [:show]
  root "home#index"
end

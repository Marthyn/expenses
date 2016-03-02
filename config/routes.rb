Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :categories, except: [:show]
  resources :expenses
  resources :shops, except: [:show]
  root "home#index"
end

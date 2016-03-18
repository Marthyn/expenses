Rails.application.routes.draw do
  mount RailsEmailPreview::Engine, at: 'emails'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :categories, except: [:show]
  resources :expenses
  resources :shops, except: [:show]
  resources :statistics, only: [:index]
  root "home#index"
  resource :accounts, only: [:new, :create, :edit, :update]
end

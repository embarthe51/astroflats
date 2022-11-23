Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :astroflats do
    resources :bookings, only: %i[new create]
  end
  # dashboard route
  get 'dashboard', to: 'astroflats#dashboard'

  resources :bookings, only: [:show, :destroy]
end

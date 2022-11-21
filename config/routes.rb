Rails.application.routes.draw do
  resources :astroflats, only: %i[index new create] do
    resources :bookings, only: %i[index show new create]
  end

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

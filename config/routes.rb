Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings do
    resources :bookings, only: %i[index new create]
    resources :missions, only: %i[index new create]
    resources :reservations, only: %i[index new create]
  end
  resources :bookings, except: %i[index new create]
  resources :missions, except: %i[index new create]
  resources :reservations, except: %i[index new create]
end

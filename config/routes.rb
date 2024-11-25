Rails.application.routes.draw do
  resources :items do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index update destroy]

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "booking-requests", to: "bookings#booking_requests"

  post "booking-requests/:id/accept", to: "bookings#accept", as: :accept
  patch "booking-requests/:id/reject", to: "bookings#reject", as: :reject

  # Defines the root path route ("/")
  # root "posts#index"
  get "my-items", to: "items#my_items"
  get "my-bookings", to: "bookings#index"
end

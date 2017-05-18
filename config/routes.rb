Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "courses#index"

  resources :courses, only: %i(index show)
  resources :subscriptions, only: %i(create destroy)
  resources :user_units, only: %i(create destroy)

  resources :units, only: %i(show) do
    resources :exercises, only: %i(show)
  end
end

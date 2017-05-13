Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :courses, only: %i(index show)
  resources :subscriptions, only: %i(create destroy)
end

Rails.application.routes.draw do
  resources :widgets
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "courses#index"

  resources :courses
  resources :subscriptions, only: %i(create destroy)
  resources :user_units, only: %i(create destroy)
  resources :subjects, only: %i(index show)

  resources :units do
    resources :exercises do
      resources :answers, only: %i(create)
    end
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "tests#index"

  resources :tests, only: %i[index edit update destroy]
  resources :test_questions, only: %i[create destroy]
  resources :questions
  resources :ways

  namespace :admin do
    resources :topics, only: %i[create new index edit update destroy show] do
      resources :units, shallow: true
    end
  end
end

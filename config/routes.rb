Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "tests#index"

  resources :tests, only: %i[index edit update destroy]
  resources :test_questions, only: %i[create destroy]
  resources :questions
  resources :ways
end

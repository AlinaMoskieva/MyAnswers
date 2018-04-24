Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "surveys#index"

  resources :surveys, only: %i[index edit update destroy]
  resources :survey_questions, only: %i[create destroy]
  resources :questions
  resources :ways
end

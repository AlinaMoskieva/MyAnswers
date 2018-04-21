Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "tests#index"

  resources :tests, only: %i[index edit update destroy]
  resources :question
end

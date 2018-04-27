Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :test
  resources :question

  namespace :admin do
    resources :topics, only: %i[create new index edit update destroy show]
  end
end

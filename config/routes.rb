Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "courses#index"

  resources :widgets
  resources :courses
  resources :subscriptions, only: %i(create destroy)
  resources :user_units, only: %i(create destroy)
  resources :subjects

  resources :units do
    resources :exercises do
      resources :answers
      resources :answer_variants
    end
  end

  get "units/:id/exercises/list/:id", to: "exercises#list", as: "unit_exercises_list"
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "tests#index"

  resources :tests, only: %i[index edit update destroy show] do
    resource :sort_index, only: %i[update], controller: :sort_indexes, module: :tests
  end
  resources :test_questions, only: %i[create destroy]
  # resources :questions
  resources :ways

  namespace :admin do
    resources :widgets, only: :index
    resources :topics, only: %i[create new index edit update destroy show] do
      resources :units, shallow: true do
        resources :questions, shallow: true
      end
    end
  end

  resources :test_questions, only: %i[index show] do
    resources :user_answers, only: :create
  end
end

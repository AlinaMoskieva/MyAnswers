Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "profiles#show"

  resources :topics, only: %i[index show]
  resources :units, only: %i[show]
  resources :tests, only: :show
  resource :profile, only: :show

  namespace :admin do
    resources :widgets, only: :index
    resources :topics, only: %i[create new index edit update destroy show] do
      resources :units, shallow: true do
        resources :questions, shallow: true
      end
    end
    resources :programs
    resources :program_tests, only: %i[create destroy]

    resources :tests, only: %i[index new create edit update destroy show] do
      resource :sort_index, only: %i[update], controller: :sort_indexes, module: :tests
    end

    resources :test_questions, only: %i[index create update destroy]
    resources :ways
  end

  resources :test_questions, only: %i[index show] do
    resources :user_answers, only: :create
  end
end

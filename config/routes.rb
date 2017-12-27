Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get "tasks_table", to: "pages#tasks"
  root to: "pages#home"
end

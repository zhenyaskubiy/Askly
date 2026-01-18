Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "questions#index"
  resources :questions
  resources :users, only: %i[new create edit update destroy]
  resource :session, only: %i[new create destroy]
end

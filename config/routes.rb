Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "categories#index"
  resources :categories do
    resources :tasks
  end
end

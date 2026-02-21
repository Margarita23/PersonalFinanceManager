Rails.application.routes.draw do
  root "main#index"

  get  "signup", to: "users#new"
  post "users",  to: "users#create"

  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "reports", to: 'reports#index'
  get "reports/report_by_category"
  get "reports/report_by_dates"
  
  resources :operations
  resources :categories

  get "up" => "rails/health#show", as: :rails_health_check

end

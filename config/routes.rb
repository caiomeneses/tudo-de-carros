Rails.application.routes.draw do
  resources :vehicles, only: [ :index, :show ]
  get "vehicles/:brand_slug/:model_slug", to: "vehicles#model", as: "vehicle_model"

  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end

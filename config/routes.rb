Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get "up" => "rails/health#show", as: :rails_health_check
end

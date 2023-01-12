Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  resources :registrations, only: %i[ new create]
  resources :logins, only: %i[ new create]
  
end

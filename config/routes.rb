Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'appointments#welcome'

  resources :appointments
  resources :users
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'time_slots#index'

  get '/auth/google_oauth2'
  get '/auth/google_oauth2/callback', to: 'auth#omniauth'
  get 'login', to: 'auth#login'
  get 'logout', to: 'auth#logout'

  resources :appointments
  resources :users
end

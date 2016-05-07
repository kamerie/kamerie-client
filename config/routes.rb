Rails.application.routes.draw do
  devise_for :users, controller: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get '/users/globals', to: 'users#globals'
  resources :users

  root 'application#home'
end

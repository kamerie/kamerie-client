Rails.application.routes.draw do
  get '/globals', to: 'application#globals'

  namespace :api do
    resources :libraries
    resources :media
  end

  root 'application#home'
end

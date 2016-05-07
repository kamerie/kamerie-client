Rails.application.routes.draw do
  get '/globals', to: 'application#globals'

  namespace :api do
    resources :libraries
  end

  root 'application#home'
end

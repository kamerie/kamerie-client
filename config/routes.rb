Rails.application.routes.draw do
  get '/globals', to: 'application#globals'

  namespace :api do
    get '/libraries/movies', to: 'libraries#movies'
    resources :libraries
    get '/media/movies', to: 'media#movies'
    resources :media
  end

  root 'application#home'
end

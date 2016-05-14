Rails.application.routes.draw do
  get '/globals', to: 'application#globals'

  namespace :api do
    get '/libraries/movies', to: 'libraries#movies'
    get '/libraries/series', to: 'libraries#series'
    resources :libraries

    get '/media/movies', to: 'media#movies'
    get '/media/series', to: 'media#series'
    resources :media

    resources :series
  end

  root 'application#home'
end

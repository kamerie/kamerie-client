Rails.application.routes.draw do
  get '/globals', to: 'application#globals'

  root 'application#home'
end

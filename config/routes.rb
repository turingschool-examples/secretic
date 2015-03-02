Rails.application.routes.draw do
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'

  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'
end

Rails.application.routes.draw do
  get  '/dashboard', to: 'dashboard#show'
  root 'home#show'
end

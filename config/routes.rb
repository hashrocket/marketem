Marketem::Application.routes.draw do
  resources :contacts, only: [:index, :new, :create]
  resources :campaigns, only: [:index, :new, :create]
  root to: 'campaigns#index'
  get 'ui/(:action)', controller: 'ui'
end

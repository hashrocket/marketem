Marketem::Application.routes.draw do
  resources :contacts, only: :index
  root to: 'campaigns#index'
  get 'ui/(:action)', controller: 'ui'
end

Marketem::Application.routes.draw do
  root to: 'campaigns#index'
  get 'ui/(:action)', controller: 'ui'
end

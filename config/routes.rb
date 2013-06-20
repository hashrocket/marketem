Marketem::Application.routes.draw do
  resources :recipients

  root to: 'pages#index'
  get 'ui(/:action)', controller: 'ui'
end

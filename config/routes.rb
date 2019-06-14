Rails.application.routes.draw do
  resources :acessos_apis
  resources :tokens
  # resources :carros

  get '/carros', to: 'carros#index'
  post '/carros', to: 'carros#create'
  get '/carros/:id', to: 'carros#show'
  put '/carros/:id', to: 'carros#update'
  delete '/carros/:id', to: 'carros#destroy'


  root to: "home#index"
  
  get '/token-acesso', to: 'tokens#token_acesso'

  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidades'
  get '/estados-proxy', to: 'estados#proxy'
  get '/carros-proxy', to: 'carros#proxy'

end

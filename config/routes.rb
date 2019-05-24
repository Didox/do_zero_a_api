Rails.application.routes.draw do
  resources :carros

  root to: "home#index"
  
  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidades'
end

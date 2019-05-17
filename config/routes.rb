Rails.application.routes.draw do
  resources :carros

  get '/estados', to: 'estados#index'
  get '/cidades', to: 'estados#lista_cidades'
end

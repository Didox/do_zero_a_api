Rails.application.routes.draw do
  resources :carros

  get '/estados', to: 'estados#index'
end

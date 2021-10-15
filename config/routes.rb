Rails.application.routes.draw do
  root to: 'main#index'

  get 'about', to: 'about#index'
end

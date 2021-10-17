# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'main#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'about', to: 'about#index'
end

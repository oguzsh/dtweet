# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    require 'sidekiq/web'

    # Sidekiq
    mount Sidekiq::Web, at: '/sidekiq'
  end

  root to: 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :tweets
end

# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'

  scope :monitoring do
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(Rails.application.credentials[:sidekiq][:username])) &
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.credentials[:sidekiq][:password]))
    end if Rails.env.production?

    mount Sidekiq::Web, at: '/sidekiq'
  end


  root to: 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :tweets
end

class User < ApplicationRecord
  has_many :tweets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.token = auth.credentials.token
      user.secret_key = auth.credentials.secret
    end
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        =  Rails.application.credentials.fetch(:twitter_api_public_key)
      config.consumer_secret     =  Rails.application.credentials.fetch(:twitter_api_secret_key)
      config.access_token        =  token
      config.access_token_secret =  secret_key
    end
  end

  def email_required?
    false
  end
end

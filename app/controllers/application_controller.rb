class ApplicationController < ActionController::Base
  def user_signed_in
    redirect_to root_path, alert: 'You need to connect your twitter account!' unless user_signed_in?
  end

  def after_sign_in_path_for(_resource)
    tweets_path
  end
end

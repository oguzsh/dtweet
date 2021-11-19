module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
      else
        session['devise.twitter_data'] = request.env['omniauth.auth'].esxcept('extra')
      end
    end

    def failure
      redirect_to root_path
    end
  end
end

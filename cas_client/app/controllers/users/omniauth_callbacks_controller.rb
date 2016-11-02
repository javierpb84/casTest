class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def cas
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      redirect_to user_cas_omniauth_authorize_path
    end
  end

end

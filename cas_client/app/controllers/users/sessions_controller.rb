class Users::SessionsController < Devise::SessionsController

  def new
    redirect_to user_cas_omniauth_authorize_path
  end

end

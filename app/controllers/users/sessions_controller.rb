class Users::SessionsController < UsersController
  skip_before_filter :authorize_user!
  ### New sessions for logging a user in
  def new
    redirect_to "/auth/google_oauth2"
  end

  ### Create the session when they've successfully authenticated

  def create
    @user = User.where_omniauth(auth_hash)
    sign_in @user
    redirect_to root_url, alert: "You have been signed in successfully."
  end

  def bypass
    @user = User.find(params[:id])
    sign_in @user
    redirect_to root_url, alert: "Bypassed user account"
  end

  ### Destroy when they want to sign out

  def destroy
    sign_out
    redirect_to root_url, alert: "You have been signed out successfully."
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end

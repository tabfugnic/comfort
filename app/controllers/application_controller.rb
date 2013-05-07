class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sign_in, :user_signed_in?, :current_user, :sign_out
  before_filter :authorize_user!, except: :welcome
  # Sign in a user
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Determine whether the users id is stored in session
  def user_signed_in?
    session.has_key? :user_id
  end

  # Get current user and stash that user away for later
  def current_user
    @_current_user ||= User.find(session[:user_id])
  end

  # sign_out is just an alias for reset_session... for now
  def sign_out
    reset_session
  end

  def authorize_user!
    return redirect_to welcome_url unless user_signed_in?
  end

end

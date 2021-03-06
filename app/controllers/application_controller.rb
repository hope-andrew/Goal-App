class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def require_log_in
    redirect_to new_session_url unless signed_in? 
  end

  def signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user(user)
    @current_user = user
    session[:session_token] = @current_user.reset_token!
  end

  def log_out_user
    current_user.reset_token!
    session[:session_token] = nil
  end
end

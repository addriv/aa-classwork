class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout!
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def flash_errors(error_source)
    flash[:errors] = error_source.errors.full_messages
  end
end

class ApplicationController < ActionController::Base

  private

  def logged_in?
    @current_user ||= User.find(session[:admin_id]) if session[:admin_id]
  end

  helper_method :logged_in?

end
  # protect_from_forgery with: :exception

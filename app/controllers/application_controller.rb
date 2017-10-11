class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

  private

  def logged_in?
    @current_user ||= User.find(session[:admin_id]) if session[:admin_id]
  end

  helper_method :logged_in?

end

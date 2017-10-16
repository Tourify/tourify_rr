class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_user
    @admin_user ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !admin_user.nil?
  end

  # 
end

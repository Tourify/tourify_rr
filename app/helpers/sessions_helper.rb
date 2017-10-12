module SessionsHelper

  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def current_user
    @current_user ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_user.nil?
  end
end

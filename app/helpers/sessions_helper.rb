module SessionsHelper

  # Logs in the given user.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Admin.find_by(id: session[:admin_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end

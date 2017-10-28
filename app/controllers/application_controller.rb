class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_admin.nil?
  end

  def organization_member?
    @organization = Organization.find(params[:id])
    if @organization.id === @current_admin.organization_id
      return true
    end
  end

  def tourify_owner?
    current_admin
    if (@current_admin.organization_id === 2)
      return true
    end
  end

  def home_org
    @organization_main = Organization.find(1)
  end
end

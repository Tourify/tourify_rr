class SessionsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin
      organization = admin.organization
      if admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to organization
      else
        flash[:alert] = 'Username or password is invalid'
        render :new
      end
    else
      flash[:alert] = 'Log in failed. Please try again.'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to new_session_path
  end

  def index
    redirect_to new_session_path
  end
end

class SessionsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(username: params[:username])
    organization = admin.organization
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to organization, notice: 'Logged in!'
    else
      flash.now.alert = 'Username or password is invalid'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = 'You have successfully logged out.'
    redirect_to '/login'
  end

end

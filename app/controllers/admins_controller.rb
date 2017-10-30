class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]
  before_action :get_organization, only: [:new, :create, :update, :destroy]

  def new
    if @organization.id === 3
    @admin = Admin.new
    else
    flash[:notice] = 'New users must use organization #3'
    redirect_to new_organization_admin_path(3)
    end
  end

  def index
    @admins = Admin.all
  end

  def show
  end

  # This serves as the registration method
  def create
    @admin = Admin.new(admin_params)
    @admin.organization = @organization
    if @admin.save
      redirect_to new_session_path, notice: 'Admin account created!'
    else
      render 'new'
    end
  end

  def update
    if @admin == current_admin
      @admin.update!(admin_params)
      if @admin.save
        redirect_to @organization, status: :accepted
      else
        render 'edit'
      end
    else
      render 'edit', {error: "You are not authorized to update this admin"}, status: :unauthorized
    end
  end

  def destroy
    if @admin == current_admin
      @admin.destroy
      flash[:notice] = 'Admin account deleted from Organization.'
      redirect_to @organization
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end

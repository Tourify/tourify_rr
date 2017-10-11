class AdminsController < ApplicationController
  before_action :authenticate, only: [:update, :destroy]

  def new
    @admin = Admin.new
  end

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @admin = Admin.new(admin_params)
    @admin.organization = @organization

    if @admin.save
      render @admin

    else
      render json: {
        errors: @admin.errors
      }, status: :bad_request
    end

  end

  def login
  admin = Admin.find_by(username: params[:username]).try(:authenticate, params[:password])
    if !admin
      render status: :unauthorized, json: {
        "error": "There is no user with that email and password"
      }
    else
      render json: {token: admin.token}
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin == current_user
      @admin.update!(admin_params)
      if @admin.save
        render :show, status: :accepted
      else
        render 'edit'
      end
    else
      render json: {error: "You are not authorized to update this admin"}, status: :unauthorized
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin == current_user
      @admin.destroy
      render json: {deleted: true}
    else
      ender json: {error: "You are not authorized to delete this admin"}, status: :unauthorized
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end

end

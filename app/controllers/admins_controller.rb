class AdminController < ApplicationController

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
    @admin = Admin.create(admin_params)
    if @admin.save
      render @admin
    else
      render 'new'
    end
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.update!(admin_params)
    render :show
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    render json: {deleted: true}
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end

end

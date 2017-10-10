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

  end

  def destroy
  end
end

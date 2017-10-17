class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def index
    if logged_in?
      redirect_to current_admin.organization
    else
      flash[:alert] = 'Please login to continue.'
      redirect_to new_session_path
    end
  end

  def show
    @organization = Organization.find(params[:id])
    if logged_in?
      render :action => 'show.html' and return
    else
      render :action => 'show.json'
    end
  end

  # def create
  #   @organization = Organization.create(organization_params)
  #   render :show, status: :created
  # end

  def update
    @organization = Organization.find(params[:id])
    if logged_in? && current_admin.organization == @organization
      @organization.update!(organization_params)
      if @organization.save
        flash[:notice] = 'Organization information sucessfully updated'
        render :show
      else
        render :edit
      end
    elsif logged_in?
      redirect_to current_admin.organization
    else
      redirect_to new_session_path
    end
  end

  # def destroy
  #   @organization = Organization.find(params[:id])
  #   if logged_in? && current_admin.organization == @organization
  #     @organization.destroy
  #     flash[:notice] = 'Organization successfully deleted.'
  #     redirect_to '/'
  #   else
  #     flash[:alert] = 'You are not authorized to delete this Organization.'
  #     render 'show'
  #   end
  # end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :url, :logo_url, :display_name, :org_photo)
  end

end

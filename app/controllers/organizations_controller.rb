class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
    if logged_in?
      render :action => 'show.html' and return
    end
    render :action => 'show.json'
  end

  def create
    @organization = Organization.create(organization_params)
    render :show, status: :created
  end

  def update
    @organization = Organization.find(params[:id])
    if logged_in? && current_user.organization == @organization
      @organization.update!(organization_params)
      if @organization.save
        flash[:notice] = 'Organization information sucessfully updated'
        render :show
      else
        flash[:notice] = 'Invalid update. Please try again.'
        render :edit
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    if logged_in? && current_user.organization == @organization
      @organization.destroy
      flash[:notice] = 'Organization successfully deleted.'
      redirect_to '/'
    else
      flash[:notice] = 'You are not authorized to delete this Organization.'
      render 'show'
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :url, :logo_url, :display_name, :org_photo)
  end

end

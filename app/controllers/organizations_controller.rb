class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.create(organization_params)
    render :show, status: :created
  end

  def updated
    @organization = Organization.find(params[:id])
    @organization.update!(organization_params)
    render :show
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    render json: {deleted: true}
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :url, :logo_url, :display_name, :org_photo)
  end

end

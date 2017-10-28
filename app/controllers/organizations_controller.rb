class OrganizationsController < ApplicationController
  # before_action:

  def new
    @organization = Organization.new
  end

  def index
    redirect_to new_session_path unless logged_in?
    @organizations = Organization.all
    respond_to do |format|
      format.html
      format.csv { send_data @organizations.to_csv }
      format.xls { send_data @organizations.to_csv(col_sep: "\t") }
    end
  end

  def show
    @organization = Organization.find(params[:id])
    if logged_in?
      render :action => 'show.html' and return
    end
    render :action => 'show.json'
  end

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

  def create
    @organization = Organization.create(organization_params)
    render :show, status: :created
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

  def set_organization
    @organization = Organization.find_by(params[:id])
  end
end

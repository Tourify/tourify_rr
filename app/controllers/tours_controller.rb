class ToursController < ApplicationController
  before_action :get_organization
  before_action :set_tour, except: [:index, :new, :create]

  def index
    if logged_in?
      redirect_to current_admin.organization
    else
      flash[:alert] = 'Please login to continue.'
      redirect_to new_session_path
    end
  end

  def new
    if logged_in?
      if organization_member?
        @tour = Tour.new
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to add content for another organization."
      end
    else
      redirect_to new_session_path
    end
  end

  def show
    if logged_in?
      if organization_member?
        render :action => 'show.html' and return
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view content for another organization." and return
      end
    end
    render :action => 'show.json'
  end

  def create
    if logged_in?
      if organization_member?
        @tour = @organization.tours.build(tour_params)
        @tour.admin = current_admin
        if @tour.save
          redirect_to organization_path(@organization)
        else
          render 'new'
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to create content for another organization."
      end
    else
      redirect_to new_session_path
    end
  end

  def edit
    if logged_in?
      if organization_member?
        if current_admin == @stop.admin
          render :action => 'edit.html'
        else
          redirect_to organization_tour_path(@current_admin.organization_id, @tour.id), notice: "You are not authorized to edit this tour."
        end
      else
        redirect_to organization_tour_path(@current_admin.organization_id, @tour.id), notice: "You are not authorized to view or edit content belonging to another organization."
      end
    else
      redirect_to new_session_path
    end
  end

  def update
    if logged_in? && current_admin.organization == @organization
      @tour.update!(tour_params)
      if @tour.save
        render 'show'
      else
        render 'edit'
      end
    else
      flash[:notice] = 'You do not have authorization to edit this tour.'
      render 'show'
    end
  end

  def destroy
    if logged_in? && current_admin.organization == @organization
      @tour.destroy
      flash[:notice] = 'Tour was successfully deleted.'
      redirect_to @organization
    else
      flash[:notice] = 'You are not authorized to delete this Tour.'
      render 'show'
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :distance, :time_in_mins)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_tour
    get_organization
    @tour = Tour.find(params[:id])
  end

  def organization_member?
    @organization = Organization.find(params[:organization_id])
    if @organization.id === @current_admin.organization_id
      return true
    end
  end
end

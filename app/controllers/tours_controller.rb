class ToursController < ApplicationController
  before_action :get_organization
  before_action :set_tour, except: [:index, :new, :create]

  def index
    if logged_in?
      redirect_to current_user.organization
    else
      flash[:alert] = 'Please login to continue.'
      redirect_to '/login'
    end
  end

  def new
    @tour = Tour.new
  end

  def show
    if logged_in?
      render :action => 'show.html' and return
    end
    render :action => 'show.json'
  end

  def create
    if current_user.organzation == @organization
      @tour = @organization.tours.build(tour_params)
      @tour.admin = current_user
      if @tour.save!
        redirect_to organization_path@organization
      else
        render 'new', notice: 'Tour creation failed'
      end
    else
      redirect_to current_user.organization, notice: 'You do not have access to create a tour for this Organization.'
    end
  end

  def edit
  end

  def update
    if logged_in? && current_user.organization == @organization
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
    @tour = Tour.find(params[:id])
    if logged_in? && current_user.organization == @organization
      @tour.destroy
      flash[:notice] = 'Tour was successfully deleted.'
      redirect_to @organization
    else
      flash[:notice] = 'You are not authorized to delete this Tour.'
      render 'show'
    end
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :distance, :time_in_mins)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

end

class ToursController < ApplicationController
  before_action :get_organization
  before_action :set_tour, except: [:index, :new, :create]
  # before_action :logged_in?, only: [:show]

  def index
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
    @tour = Tour.new(tour_params)
    @tour.admin_id = 1
    @tour.organization = @organization

    @tour.save!
    redirect_to organization_path@organization
  end

  def update
  end

  def destroy
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

  # def is_admin?
  #   set_tour
  # end
end

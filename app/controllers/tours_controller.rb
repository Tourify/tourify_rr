class ToursController < ApplicationController
  before_action :get_organization
  before_action

  def index
  end

  def new
    @tour = Tour.new
  end

  def show
    @tour = Tour.find(params[:id])
    render 'show.json'
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

  def tour_params
    params.require(:tour).permit(:name, :description, :distance, :time_in_mins)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

end

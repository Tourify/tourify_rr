class ToursController < ApplicationController
  before_action :get_organization

  def index
  end

  def show
    @tour = Tour.find(params[:id])
    render 'show.json'
  end

  def create
    # @tour = Tour.new(tour_params)
    #
    # if @tour.save
    #   redirect_to tour_stop_index_path
    # else
    #   redirect_to root
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

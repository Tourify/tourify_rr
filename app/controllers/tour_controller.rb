class TourController < ApplicationController

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.create(tour_params)
    @tour.save
    render :show, status: created
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :distance, :time_in_mins)
  end

end

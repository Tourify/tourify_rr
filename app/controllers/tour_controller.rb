class TourController < ApplicationController
  # before_action :set_tour

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

  # def set_tour
  #   @tour =
  # end
end

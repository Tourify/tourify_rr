class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :update, :destroy]
  before_action :get_tour, only: [:create]

  def new
    @stop = Stop.new
  end

  def index
    @stops = Stop.all
  end

  def create
    @stop = Stop.create(stop_params)
  end

  def show
    render 'show.json'
  end

  def import
    Stop.import(params[:file])
    redirect_to tour_stops_path, notice: "Data imported"
  end

  def updated
    @stop.update!(stop_params)
  end

  def destroy
    @stop.destroy
  end

  private

  def set_stop
    @stop = Stop.find(params[:id])
  end

  def get_tour
    @tour = Tour.find(params[:tour_id])
  end

  def stop_params
    params.require(:stop).permit(:stop_num, :name, :directions_to_next_stop, :learn_more_URL, :travel_tip, :description, :location, :image_current, :image_historic, :gps_long, :gps_lat, :badge)
  end
end

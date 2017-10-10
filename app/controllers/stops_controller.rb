class StopsController < ApplicationController
  # before_action :set_stop, only: [:show, :edit, :update, :destroy]

  def index
    @stops = Stop.all
    render 'index.json'
  end

  def show
    render 'show.json'
  end

  def import
    Stop.import(params[:file])
    redirect_to tour_stops_path, notice: "Data imported"
  end

  # private
  # def set_stop
  #   @stop = Stop.find(params[:id])
  # end
end

class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :update, :destroy, :edit]
  before_action :get_tour, only: [:create, :new]

  def new
    @stop = Stop.new
  end

  def index
    @stops = Stop.all
  end

  def download_template
    send_file('./public/Stops_template.xlsx')
  end

  def create
    @stop = @tour.stops.build(stop_params)
    @stop.admin = current_user
    if @stop.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      render :action => 'show.html' and return
    end
    render :action => 'show.json'
  end

  def import
    Stop.import(params[:file])
    redirect_to organization_tour_stops_path, notice: "Data imported"
  end

  def edit
  end

  def update
    if current_user = stop.admin
      @stop.update!(stop_params)
      redirect_to @stop
    else
      flash[:notice] = "You are not authorized."
      render 'edit'
    end
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

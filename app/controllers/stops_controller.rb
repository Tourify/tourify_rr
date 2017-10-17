class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :update, :edit, :destroy]
  before_action :get_tour, only: [:index, :create, :new, :destroy]
  before_action :get_organization, only: [:index, :destroy, :update]

  def new
    @stop = Stop.new
  end

  def index
    @stops = Stop.all
    respond_to do |format|
      format.html
      format.csv { send_data @stops.to_csv }
      format.xls { send_data @stops.to_csv(col_sep: "\t") }
    end
  end

  def download_template
    send_file('./public/Stops_template.xlsx')
  end

  def create
    @stop = @tour.stops.build(stop_params)
    @stop.admin = current_admin
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
    if current_admin == @stop.admin
      @stop.update!(stop_params)
      redirect_to @stop
    else
      flash[:notice] = "You are not authorized to update this stop."
      render 'edit'
    end
  end

  def destroy
    if current_admin == @stop.admin
      @stop.destroy
      flash[:notice] = 'The stop was successfully deleted.'
      redirect_to organization_tour_stops_path
    else
      flash[:notice] = 'You are not authorized to delete this Stop.'
      render 'show'
    end
  end

  private

  def stop_params
    params.require(:stop).permit(:stop_num, :name, :directions_to_next_stop, :learn_more_URL, :travel_tip, :description, :location, :image_current, :image_historic, :gps_long, :gps_lat, :badge)
  end

  def set_stop
    get_organization
    get_tour
    @stop = @tour.stops.find_by(stop_num: params[:id])
  end

  def get_tour
    get_organization
    @tour = Tour.find(params[:tour_id])
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end
end

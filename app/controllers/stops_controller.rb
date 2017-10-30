class StopsController < ApplicationController
  before_action :set_stop, only: [:show, :update, :edit, :destroy]
  before_action :get_tour, except: [:download_template]

  def new
    if logged_in?
      if organization_member?
        @stop = Stop.new
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to add content for another organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def index
    if logged_in?
      if organization_member?
        @stops = Stop.all
        respond_to do |format|
          format.html
          format.csv { send_data @tour.stops.to_csv }
          format.xls { send_data @tour.stops.to_csv(col_sep: "\t") }
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def show
    if logged_in?
      if organization_member?
        render :action => 'show.html' and return
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations." and return
      end
    end
    render :action => 'show.json'
  end

  def create
    if logged_in?
      if organization_member?
        @stop = @tour.stops.build(stop_params)
        @stop.admin = current_admin
        if @stop.save
          render 'show'
        else
          render 'new'
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def import
    if logged_in?
      if organization_member?
        Stop.import(params[:file], params[:tour_id])
        redirect_to organization_tour_stops_path, notice: "Data imported"
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def edit
    if logged_in?
      if organization_member?
        if current_admin == @stop.admin
          render :action => 'edit.html'
        else
          redirect_to organization_tour_stop_path(@current_admin.organization_id, @tour.id, @stop.id), notice: "You are not authorized to edit this stop."
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to another organization."
      end
    else
      redirect_to new_session_path
    end
  end

  def download_template
    redirect_to new_session_path unless logged_in?
    send_file('./public/Tourify_stops_template.xlsx')
  end

  def update
    if logged_in?
      if organization_member?
        if current_admin == @stop.admin
          @stop.update!(stop_params)
          redirect_to organization_tour_stop_path
        else
          flash[:notice] = "You are not authorized to update this stop."
          render 'edit'
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def destroy
    if logged_in?
      if organization_member?
        if current_admin == @stop.admin
          @stop.destroy
          flash[:notice] = 'The stop was successfully deleted.'
          redirect_to organization_tour_stops_path
        else
          flash[:notice] = 'You are not authorized to delete this Stop.'
          render 'show'
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  def destroy_stops
    @stops = @tour.stops
    if logged_in?
      if organization_member?
        if current_admin == @tour.admin
          @stops.destroy_all
          flash[:notice] = 'Stops were successfully deleted.'
          redirect_to organization_tour_stops_path
        else
          flash[:notice] = 'You are not authorized to delete these stops.'
        end
      else
        redirect_to organization_path(@current_admin.organization_id), notice: "You are not authorized to view or edit content belonging to other organizations."
      end
    else
      redirect_to new_session_path
    end
  end

  private

  def stop_params
    params.require(:stop).permit(:stop_num, :name, :directions_to_next_stop, :learn_more_URL, :travel_tip, :description, :location, :image_current, :image_historic, :gps_long, :gps_lat, :badge)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end

  def get_tour
    get_organization
    @tour = Tour.find(params[:tour_id])
  end

  def set_stop
    get_organization
    get_tour
    @stop = @tour.stops.find_by(stop_num: params[:id])
  end

  def organization_member?
    @organization = Organization.find(params[:organization_id])
    if @organization.id === @current_admin.organization_id
      return true
    end
  end
end

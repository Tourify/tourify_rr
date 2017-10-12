class ToursController < ApplicationController
  before_action :get_organization
  before_action :set_tour, except: [:index, :new, :create]

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
    if @tour.save!
      redirect_to organization_path@organization
    else
      render 'new', errors: @tour.errors
    end
  end

  def update
    if logged_in? && current_user.organization == @organization
      @tour.update!(tour_params)
      if @tour.save
        render :show, status: :accepted
      else
        render 'edit'
      end
    else
      flash[:notice] = 'You do not have authorization to edit this tour.'
      render 'show'
    end
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

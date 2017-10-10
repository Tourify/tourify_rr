class StopsController < ApplicationController
  def index
    @stops = Stop.all
  end

  def import
    Stop.import(params[:file])
    redirect_to stops_path, notice: "Data imported"
  end
end

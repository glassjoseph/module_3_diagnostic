class SearchController < ApplicationController

  def index
    NrelService.find_stations(params[:q])
    @stations = Station.take(10)
  end

end

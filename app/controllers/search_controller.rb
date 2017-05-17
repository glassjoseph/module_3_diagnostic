class SearchController < ApplicationController

  def index
    binding.pry
    NrelServices.find_stations(params[:q])
  end

end

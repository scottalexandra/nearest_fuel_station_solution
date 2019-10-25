class SearchController < ApplicationController
  def index
    facade = SearchFacade.new(params[:location])
    render locals: {
      nearest_station: facade.nearest_station
    }
  end
end

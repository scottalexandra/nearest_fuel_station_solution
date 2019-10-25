class SearchFacade
  def initialize(initial_location)
    @initial_location = initial_location
  end

  def nearest_station
    nearest_station_data = get_nearest_station_data[:fuel_stations][0]
    station = create_station(nearest_station_data)
    StationDecorator.new(station, initial_location)
  end

  private

  attr_reader :initial_location

  def get_nearest_station_data
    nrel_service.get_nearest_station(initial_location)
  end

  def create_station(station_data)
    Station.new(station_data)
  end

  def nrel_service
    NrelService.new
  end
end

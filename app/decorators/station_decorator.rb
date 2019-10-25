class StationDecorator < SimpleDelegator
  def initialize(station, initial_location)
    @station = station
    @initial_location = initial_location
    super(station)
  end

  def distance
    directions_data.distance
  end

  def travel_time
    directions_data.travel_time
  end

  def instructions
    directions_data.instructions
  end

  private

  attr_reader :station, :initial_location

  def directions_data
    DirectionsData.new(get_directions_data)
  end

  def get_directions_data
    google_data = google_service.get_directions(initial_location, station.address)
    @directions ||= google_data[:routes][0][:legs][0][:steps][0]
  end

  def google_service
    GoogleService.new
  end
end

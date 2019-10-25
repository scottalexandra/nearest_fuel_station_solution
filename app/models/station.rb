class Station
  attr_reader :name, :address, :fuel_type, :access_times, :distance, :travel_time, :directions

  def initialize(station_data)
    @name = station_data[:station_name]
    @address = format_address(
      station_data[:street_address],
      station_data[:city],
      station_data[:state],
      station_data[:zip]
    )
    @fuel_type = station_data[:fuel_type_code]
    @access_times = station_data[:access_days_time]
    @distance = nil
    @travel_time = nil
    @directions = nil
  end

  def format_address(street, city, state, zip)
    "#{street}, #{city}, #{state} #{zip}"
  end

  def set_distance(distance)
    @distance = distance
  end

  def set_travel_time(travel_time)
    @travel_time = travel_time
  end

  def set_directions(directions)
    @directions = directions
  end
end

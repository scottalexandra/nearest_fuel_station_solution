class DirectionsData
  attr_reader :distance, :travel_time, :instructions

  def initialize(directions_data)
    @distance = directions_data[:distance][:text]
    @travel_time = directions_data[:duration][:text]
    @instructions = directions_data[:html_instructions]
  end
end

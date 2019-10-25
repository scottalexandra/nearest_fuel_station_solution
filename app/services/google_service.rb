class GoogleService
  def get_directions(initial_location, final_location)
    response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params[:origin] = initial_location
      req.params[:destination] = final_location
      req.params[:key] = ENV['google_api_key']
    end

    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

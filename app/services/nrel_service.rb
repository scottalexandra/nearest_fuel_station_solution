class NrelService
  def get_nearest_station(initial_location)
    response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['api_key'] = ENV['nrel_api_key']
      req.params['location'] = initial_location
      req.params['type'] = 'ELEC'
      req.params['limit'] = 1
    end
    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

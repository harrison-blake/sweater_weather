class GeocodeService
  def self.long_and_lat(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |request|
      request.params['key'] = ENV['map_quest_key']
      request.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_directions(origin, destination)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route") do |request|
      request.params['key'] = ENV['map_quest_key']
      request.params['from'] = origin
      request.params['to'] = destination
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end

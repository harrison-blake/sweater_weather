class GeocodeService
  def self.long_and_lat(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |request|
      request.params['key'] = 'L34xmSgePQGl6pnVP0Nqdom9w99vjoO4'
      request.params['location'] = location
    end

    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end

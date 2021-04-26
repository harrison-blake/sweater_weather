class WeatherService
  def self.weather(long_and_lat)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |request|
      request.params['lat'] = long_and_lat[1]
      request.params['lon'] = long_and_lat[0]
      request.params['appid'] = '40e319a5c5bf9cb2e0e6eef432758b3a'
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end

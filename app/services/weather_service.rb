class WeatherService
  def self.weather(long_and_lat)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |request|
      request.params['lat'] = long_and_lat[1]
      request.params['lon'] = long_and_lat[0]
      request.params['units'] = 'imperial'
      request.params['appid'] = ENV['weather_key']
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end

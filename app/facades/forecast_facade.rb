class ForecastFacade
  def self.get_weather_data(location)
    parsed = GeocodeService.long_and_lat(location)

    lat = parsed[:results][0][:locations][0][:latLng][:lat]
    lng = parsed[:results][0][:locations][0][:latLng][:lng]
    long_and_lat = [lng, lat]

    WeatherService.weather(long_and_lat)
  end
end

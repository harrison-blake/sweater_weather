class ForecastFacade
  def self.get_weather_data(location)
    parsed = GeocodeService.long_and_lat(location)

    lat = parsed[:results][0][:locations][0][:latLng][:lat]
    lng = parsed[:results][0][:locations][0][:latLng][:lng]
    long_and_lat = [lng, lat]

    WeatherService.weather(long_and_lat)
  end

  def self.create_daily_weather(weather)
    daily_weather = []

    weather[:daily].each_with_index do |day, i|
      daily_weather << DailyWeather.new(day) if i < 5
    end

    daily_weather
  end

  def self.create_hourly_weather(weather)
    hourly_weather = []

    weather[:hourly].each_with_index do |hour, i|
      hourly_weather << HourlyWeather.new(hour) if i < 5
    end

    hourly_weather
  end

  def self.forcast_from_location(location)
    weather = get_weather_data(location)

    current = CurrentWeather.new(weather)
    daily = create_daily_weather(weather)
    hourly = create_hourly_weather(weather)

    Forecast.new(current, daily, hourly)
  end
end

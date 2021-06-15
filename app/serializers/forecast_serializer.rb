class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attribute :current_weather do |object|
    {
      datetime: object.current_weather.dt,
      temperature: object.current_weather.temp,
      sunrise: object.current_weather.sunrise,
      sunset: object.current_weather.sunset,
      feels_like: object.current_weather.feels_like,
      humidity: object.current_weather.humidity,
      uvi: object.current_weather.uvi,
      visibility: object.current_weather.visibility,
      conditions: object.current_weather.conditions,
      icon: object.current_weather.icon
    }
  end
end

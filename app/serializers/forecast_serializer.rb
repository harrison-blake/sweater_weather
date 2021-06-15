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

  attribute :daily_weather do |object|
    object.daily_weather.each do |day|
      {
        datetime: day.dt,
        max_temp: day.max_temp,
        min_temp: day.min_temp,
        sunrise: day.sunrise,
        sunset: day.sunset,
        conditions: day.conditions,
        icon: day.icon
      }
    end
  end

  attribute :hourly_weather do |object|
    object.hourly_weather.each do |hour|
      {
        time: hour.dt,
        temperature: hour.temperature,
        conditions: hour.conditions,
        icon: hour.icon
      }
    end
  end
end

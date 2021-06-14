class ForecastSerializer
  include FastJsonapi::ObjectSerializer

    attribute :current_weather do |object|
      {
        datetime: object.current_weather_dt,
        temperature: object.current_weather_temp,
        sunrise: object.current_weather_sunrise,
        sunset: object.current_weather_sunset,
        feels_like: object.current_weather_feels_like,
        humidity: object.current_weather_humidity,
        uvi: object.current_weather_uvi,
        visibility: object.current_weather_visibility,
        conditions: object.current_weather_conditions,
        icon: object.current_weather_icon,
      }
    end

    attribute :daily_weather do |object|
      {
        date: object.daily_weather_dt,
        sunrise: object.daily_weather_sunrise
      }
    end

    attribute :hourly_weather do |object|
      {
        time: object.hourly_weather_dt,
        conditions: object.hourly_weather_conditions
      }
    end
end

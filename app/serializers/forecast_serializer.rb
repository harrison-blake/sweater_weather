class ForecastSerializer
  include FastJsonapi::ObjectSerializer

    attribute :current_weather do |object|
      binding.pry
      {
        datetime: object.current_weather_dt,
        temperature: object.current_weather_temp
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

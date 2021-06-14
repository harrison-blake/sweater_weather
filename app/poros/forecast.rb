class Forecast
  attr_reader :current_weather_dt,
              :current_weather_temp,
              :current_weather_sunset,
              :current_weather_sunrise,
              :current_weather_feels_like,
              :current_weather_humidity,
              :current_weather_uvi,
              :current_weather_uvi,
              :current_weather_conditions,
              :current_weather_icon,
              :daily_weather_dt,
              :daily_weather_sunrise,
              :hourly_weather_dt,
              :hourly_weather_conditions,
              :id

  def initialize(data)
    @current_weather_dt = data[:current][:dt]
    @current_weather_sunrise = data[:current][:sunrise]
    @current_weather_sunset = data[:current][:sunset]
    @current_weather_feels_like = data[:current][:feels_like]
    @current_weather_temp = data[:current][:temp]
    @current_weather_humidity = data[:current][:humidity]
    @current_weather_uvi = data[:current][:uvi]
    @current_weather_visibility = data[:current][:visibility]
    @current_weather_conditions = data[:current][:weather][0][:description]
    @current_weather_conditions = data[:current][:weather][0][:icon]
    @daily_weather_dt = data[:daily][0][:dt]
    @daily_weather_sunrise = data[:daily][0][:dt]
    @hourly_weather_dt = data[:hourly][0][:dt]
    @hourly_weather_conditions = data[:hourly][0][:weather][0][:description]
    @id = nil
  end
end

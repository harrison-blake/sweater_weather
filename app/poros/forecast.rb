class Forecast
  attr_reader :current_weather_dt,
              :current_weather_temp,
              :daily_weather_dt,
              :daily_weather_sunrise,
              :hourly_weather_dt,
              :hourly_weather_conditions,
              :id

  def initialize(data)
    @current_weather_dt = data[:current][:dt]
    @current_weather_temp = data[:current][:temp]
    @daily_weather_dt = data[:daily][0][:dt]
    @daily_weather_sunrise = data[:daily][0][:dt]
    @hourly_weather_dt = data[:hourly][0][:dt]
    @hourly_weather_conditions = data[:hourly][0][:weather][0][:description]
    @id = nil
  end
end

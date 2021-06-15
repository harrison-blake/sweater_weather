class CurrentWeather
  attr_reader :current_weather_dt,
              :current_weather_temp,
              :current_weather_sunset,
              :current_weather_sunrise,
              :current_weather_feels_like,
              :current_weather_humidity,
              :current_weather_uvi,
              :current_weather_visibility,
              :current_weather_conditions,
              :current_weather_icon

  def initialize(data)
    @current_weather_dt = Time.at(data[:current][:dt]).to_s
    @current_weather_sunrise = Time.at(data[:current][:sunrise]).to_s
    @current_weather_sunset = Time.at(data[:current][:sunset]).to_s
    @current_weather_feels_like = data[:current][:feels_like]
    @current_weather_temp = data[:current][:temp]
    @current_weather_humidity = data[:current][:humidity]
    @current_weather_uvi = data[:current][:uvi]
    @current_weather_visibility = data[:current][:visibility]
    @current_weather_conditions = data[:current][:weather][0][:description]
    @current_weather_icon = data[:current][:weather][0][:icon]
  end
end

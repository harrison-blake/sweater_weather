class CurrentWeather
  attr_reader :dt,
              :temp,
              :sunset,
              :sunrise,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @dt = Time.at(data[:current][:dt]).to_s
    @sunrise = Time.at(data[:current][:sunrise]).to_s
    @sunset = Time.at(data[:current][:sunset]).to_s
    @feels_like = data[:current][:feels_like]
    @temp = data[:current][:temp]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end
end

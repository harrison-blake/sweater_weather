class Forecast
  attr_reader :current_weather,
              :id

  def initialize(current)
    @id = nil
    @current_weather = current
  end
end

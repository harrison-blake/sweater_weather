class WeatherBooks
  attr_reader :id,
              :books,
              :forecast,
              :temperature,
              :total_books_found

  def initialize(weather, books)
    @id = nil
    @total_books_found = books.length
    @books = books
    @forecast = weather.current_weather_conditions
    @temperature = weather.current_weather_temp
  end
end

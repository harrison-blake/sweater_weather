class Api::V1::BooksController < ApplicationController
  def search
    forecast = ForecastFacade.get_forecast(params[:location])
    book_data = BooksService.books_by_location(params[:location])

    books = []
    book_data[:docs].each do |book_info|
      books << Book.new(book_info)
    end

    weather_and_books = WeatherBooks.new(forecast, books)

    render json: WeatherBooksSerializer.new(weather_and_books)
  end
end

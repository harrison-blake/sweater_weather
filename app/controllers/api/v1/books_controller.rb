class Api::V1::BooksController < ApplicationController
  def search
    book_data = BooksService.books_by_location(params[:location])
    parsed = GeocodeService.long_and_lat(params[:location])
    lat = parsed[:results][0][:locations][0][:latLng][:lat]
    lng = parsed[:results][0][:locations][0][:latLng][:lng]
    long_and_lat = [lng, lat]
    weather_data = WeatherService.weather(long_and_lat)
    forecast = Forecast.new(weather_data)

    num = book_data[:numFound]
    books = []

    book_data[:docs].each do |book_info|
      books << Book.new(book_info)
    end

    weather_and_books = WeatherBooks.new(forecast, books)

    render json: WeatherBooksSerializer.new(weather_and_books)
  end
end

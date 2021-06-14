require 'rails_helper'

RSpec.describe WeatherBooks do
  describe 'happy path' do
    it "should build a weather_book PORO based on given data" do
      location = 'baltimore,md'
      book_data = BooksService.books_by_location(location)

      books = []

      book_data[:docs].each do |book_info|
        books << Book.new(book_info)
      end

      parsed = GeocodeService.long_and_lat(location)
      lat = parsed[:results][0][:locations][0][:latLng][:lat]
      lng = parsed[:results][0][:locations][0][:latLng][:lng]
      long_and_lat = [lng, lat]
      weather_data = WeatherService.weather(long_and_lat)
      forecast = Forecast.new(weather_data)

      weather_books = WeatherBooks.new(forecast, books)

      expect(weather_books.id).to eq(nil)
      expect(weather_books.books_array).to be_a(Array)
      expect(weather_books.forecast).to be_a(String)
      expect(weather_books.temperature).to be_a(Float)
      expect(weather_books.total_books_found).to be_a(Integer)
    end
  end
end

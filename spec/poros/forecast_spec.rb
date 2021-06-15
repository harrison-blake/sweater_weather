require 'rails_helper'

RSpec.describe Forecast do
  describe 'happy path' do
    it "should build a forecast PORO based on given data" do
      data = []
      daily_weather = []
      hourly_weather = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      data[:daily].each_with_index do |day, i|
        daily_weather << DailyWeather.new(day) if i < 5
      end

      data[:hourly].each_with_index do |day, i|
        hourly_weather << HourlyWeather.new(day) if i < 8
      end

      forecast = Forecast.new(data, daily_weather, hourly_weather)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.daily_weather).to be_a(Array)
      expect(forecast.hourly_weather).to be_a(Array)
      expect(forecast.id).to eq(nil)
    end
  end
end

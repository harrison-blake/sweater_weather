require 'rails_helper'

RSpec.describe Forecast do
  describe 'happy path' do
    it "should build a forecat PORO based on give data" do
      data = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      forecast = Forecast.new(data)
      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather_dt).to be_a(Integer)
      expect(forecast.current_weather_temp).to be_a(Float)
      expect(forecast.daily_weather_dt).to be_a(Integer)
      expect(forecast.daily_weather_sunrise).to be_a(Integer)
      expect(forecast.hourly_weather_dt).to be_a(Integer)
      expect(forecast.hourly_weather_conditions).to be_a(String)
    end
  end
end

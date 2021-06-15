require 'rails_helper'

RSpec.describe  HourlyWeather do
  describe 'happy path' do
    it "should build a HourlyWeather PORO based on given data" do
      data = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      hourly_weather = HourlyWeather.new(data[:hourly][0])

      expect(hourly_weather).to be_a(HourlyWeather)
      expect(hourly_weather.dt).to be_a(String)
      expect(hourly_weather.temperature).to be_a(Float)
      expect(hourly_weather.conditions).to be_a(String)
      expect(hourly_weather.icon).to be_a(String)
    end
  end
end

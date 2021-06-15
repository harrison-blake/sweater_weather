require 'rails_helper'

RSpec.describe  DailyWeather do
  describe 'happy path' do
    it "should build a DailyWeather PORO based on given data" do
      data = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      daily_weather = DailyWeather.new(data[:daily][0])

      expect(daily_weather).to be_a(DailyWeather)
      expect(daily_weather.dt).to be_a(String)
      expect(daily_weather.sunrise).to be_a(String)
      expect(daily_weather.sunset).to be_a(String)
      expect(daily_weather.max_temp).to be_a(Float)
      expect(daily_weather.min_temp).to be_a(Float)
      expect(daily_weather.conditions).to be_a(String)
      expect(daily_weather.icon).to be_a(String)
    end
  end
end

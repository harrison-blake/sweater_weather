require 'rails_helper'

RSpec.describe CurrentWeather do
  describe 'happy path' do
    it "should build a CurrentWeather PORO based on given data" do
      data = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      current_weather = CurrentWeather.new(data)

      expect(current_weather).to be_a(CurrentWeather)
      expect(current_weather.dt).to be_a(String)
      expect(current_weather.sunrise).to be_a(String)
      expect(current_weather.sunset).to be_a(String)
      expect(current_weather.feels_like).to be_a(Float)
      expect(current_weather.humidity).to be_a(Integer)
      expect(current_weather.uvi).to be_a(Float)
      expect(current_weather.visibility).to be_a(Integer)
      expect(current_weather.conditions).to be_a(String)
      expect(current_weather.icon).to be_a(String)
      expect(current_weather.temp).to be_a(Float)
    end
  end
end

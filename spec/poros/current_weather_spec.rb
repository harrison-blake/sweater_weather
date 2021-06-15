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
      expect(current_weather.current_weather_dt).to be_a(String)
      expect(current_weather.current_weather_sunrise).to be_a(String)
      expect(current_weather.current_weather_sunset).to be_a(String)
      expect(current_weather.current_weather_feels_like).to be_a(Float)
      expect(current_weather.current_weather_humidity).to be_a(Integer)
      expect(current_weather.current_weather_uvi).to be_a(Float)
      expect(current_weather.current_weather_visibility).to be_a(Integer)
      expect(current_weather.current_weather_conditions).to be_a(String)
      expect(current_weather.current_weather_icon).to be_a(String)
      expect(current_weather.current_weather_temp).to be_a(Float)
    end
  end
end

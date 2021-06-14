require 'rails_helper'

RSpec.describe ForecastFacade do
  describe "happy path" do
    it 'tests the structure of our api data for ForecastFacade get forecast method' do
      location = 'Denver,CO'
      forecast = ForecastFacade.get_forecast(location)

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_weather_dt).to be_a(String)
      expect(forecast.current_weather_temp).to be_a(Float)
      expect(forecast.daily_weather_dt).to be_a(Integer)
      expect(forecast.daily_weather_sunrise).to be_a(Integer)
      expect(forecast.hourly_weather_dt).to be_a(Integer)
      expect(forecast.hourly_weather_conditions).to be_a(String)
    end
  end
end

require 'rails_helper'

RSpec.describe ForecastFacade do
  describe "happy path" do
    describe "method forecast_from_location" do
      xit 'tests the structure of data returned' do
        location = 'Denver,CO'
        forecast = ''

        VCR.use_cassette('forecast') do
          forecast = ForecastFacade.forcast_from_location(location)
        end

        expect(forecast).to be_a(Forecast)
        expect(forecast.id).to eq(nil)
        expect(forecast.current_weather).to be_a(CurrentWeather)
        expect(forecast.daily_weather).to be_a(Array)
        expect(forecast.hourly_weather).to be_a(Array)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe WeatherService do
  describe "happy path" do
    it 'tests the structure of our api data for weather service' do
      data = []
      long_and_lat = [-104.984853, 39.738453]

      VCR.use_cassette('weather') do
        data = WeatherService.weather(long_and_lat)
      end

      expect(data).to be_a(Hash)
      expect(data[:current]).to be_a(Hash)
      expect(data[:current][:dt]).to be_a(Integer)
      expect(data[:current][:temp]).to be_a(Float)
      expect(data[:hourly]).to be_a(Array)
      expect(data[:hourly][0][:dt]).to be_a(Integer)
      expect(data[:hourly][0][:weather][0][:description]).to be_a(String)
      expect(data[:daily]).to be_a(Array)
      expect(data[:daily][0][:dt]).to be_a(Integer)
      expect(data[:daily][0][:sunrise]).to be_a(Integer)
    end
  end
end

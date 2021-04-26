require 'rails_helper'

RSpec.describe GeocodeService do
  describe "happy path" do
    it 'tests the structure of our api data for geocode address (long_and_lat)' do
      data = []
      location = 'Denver,CO'

      VCR.use_cassette('long_and_lat') do
        data = GeocodeService.long_and_lat(location)
      end

      expect(data).to be_a(Hash)
      expect(data[:info]).to be_a(Hash)
      expect(data[:results]).to be_a(Array)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results][0][:locations]).to be_a(Array)
      expect(data[:results][0][:locations][0]).to be_a(Hash)
      expect(data[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end
end

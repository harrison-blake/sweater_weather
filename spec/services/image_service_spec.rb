require 'rails_helper'

RSpec.describe ImageService do
  describe "happy path" do
    it 'tests the structure of our api data for the image service' do
      data = []
      location = 'Denver,CO'

      VCR.use_cassette('background_image') do
        data = ImageService.get_image(location)
      end

      expect(data).to be_a(Hash)
      expect(data[:results]).to be_a(Array)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results][0][:links]).to be_a(Hash)
      expect(data[:results][0][:links][:html]).to be_a(String)
      expect(data[:results][0][:urls]).to be_a(Hash)
      expect(data[:results][0][:urls][:full]).to be_a(String)
      expect(data[:results][0][:urls][:thumb]).to be_a(String)
      expect(data[:results][0][:user]).to be_a(Hash)
      expect(data[:results][0][:user][:name]).to be_a(String)
    end
  end
end

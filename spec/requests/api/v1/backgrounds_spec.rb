require 'rails_helper'

describe 'Backgrounds API' do
  describe 'Happy Path' do
    it 'returns forecast data in the correct format' do
      VCR.use_cassette('denver_background') do
        get '/api/v1/backgrounds?location=denver,co'
      end

      expect(response).to be_success

      backgrounds = JSON.parse(response.body, symbolize_names: true)

      expect(backgrounds).to be_a(Hash)
      expect(backgrounds[:data]).to be_a(Hash)
      expect(backgrounds[:data][:id]).to eq(nil)
      expect(backgrounds[:data][:type]).to be_a(String)
      expect(backgrounds[:data][:attributes]).to be_a(Hash)
      expect(backgrounds[:data][:attributes][:image]).to be_a(Hash)
      expect(backgrounds[:data][:attributes][:image][:location]).to be_a(String)
      expect(backgrounds[:data][:attributes][:image][:image_url]).to be_a(String)
      expect(backgrounds[:data][:attributes][:credit]).to be_a(Hash)
      expect(backgrounds[:data][:attributes][:credit][:source]).to be_a(String)
      expect(backgrounds[:data][:attributes][:credit][:author]).to be_a(String)
    end
  end
end

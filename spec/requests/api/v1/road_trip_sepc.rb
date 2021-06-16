require 'rails_helper'

describe 'Road Trip API' do
  describe 'Happy Path' do
    it "returns a 201 status and correct structure response" do
      user = User.create!(email: 'testemail@test.com',
                       password: 'test',
          password_confirmation: 'test',
                        api_key: 'bb2a52d9c78f9f38bdc1fef922041fbd'
      )

      travel_params = ({
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: 'bb2a52d9c78f9f38bdc1fef922041fbd'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('road_trip') do
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip: travel_params)
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:start_city)
      expect(user[:data][:attributes]).to have_key(:end_city)
      expect(user[:data][:attributes]).to have_key(:travel_time)
      expect(user[:data][:attributes]).to have_key(:weather_at_eta)
      expect(user[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(user[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(user[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end
end

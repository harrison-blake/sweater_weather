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

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip[:data]).to be_a(Hash)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to be_a(Hash)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end

  describe "Sad Path" do
    it "returns impossible for travel time if trip isn't possible by car" do
      user = User.create!(email: 'testemail@test.com',
                       password: 'test',
          password_confirmation: 'test',
                        api_key: 'bb2a52d9c78f9f38bdc1fef922041fbd'
      )

      travel_params = ({
                  origin: "Denver,CO",
                  destination: "London,UK",
                  api_key: 'bb2a52d9c78f9f38bdc1fef922041fbd'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('road_trip_impossible') do
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip: travel_params)
      end

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).successful?
      expect(trip[:data][:attributes][:travel_time]).to eq('impossible')
      expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to eq(nil)
      expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to eq(nil)
    end
  end
end

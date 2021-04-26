require 'rails_helper'

describe 'Forecasts API' do
  describe 'Happy Path' do
    it 'returns forecast data in the correct format' do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_success

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(forecast[:data][:attributes][:daily_weather]).to have_key(:date)
      expect(forecast[:data][:attributes][:daily_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:time)
      expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    end
  end
end

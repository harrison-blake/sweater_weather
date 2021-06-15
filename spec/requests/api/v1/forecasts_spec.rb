require 'rails_helper'

describe 'Forecasts API' do
  describe 'Happy Path' do
    it 'returns forecast data in the correct format' do
      VCR.use_cassette('denver_forecast') do
        get '/api/v1/forecast?location=denver,co'
      end

      expect(response).to be_success

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:dt)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
      expect(forecast[:data][:attributes][:daily_weather][0]).not_to have_key(:humidity)
      expect(forecast[:data][:attributes][:daily_weather][0]).not_to have_key(:visibility)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:dt)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
      expect(forecast[:data][:attributes][:hourly_weather][0]).not_to have_key(:max_temp)
      expect(forecast[:data][:attributes][:hourly_weather][0]).not_to have_key(:humidity)
    end
  end
end

class Api::V1::ForecastController < ApplicationController
  def index
    parsed = GeocodeService.long_and_lat(params[:location])
    lat = parsed[:results][0][:locations][0][:latLng][:lat]
    lng = parsed[:results][0][:locations][0][:latLng][:lng]
    long_and_lat = [lng, lat]
    
    weather = WeatherService.weather(long_and_lat)
    current_weather = CurrentWeather.new(weather)
    forecast = Forecast.new(current_weather)

    render json: ForecastSerializer.new(forecast)
  end
end

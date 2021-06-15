class Api::V1::ForecastController < ApplicationController
  def index
    weather = ForecastFacade.get_weather_data(params[:location])

    current_weather = CurrentWeather.new(weather)

    daily_weather = []

    weather[:daily].each_with_index do |day, i|
      daily_weather << DailyWeather.new(day) if i < 5
    end

    hourly_weather = []

    weather[:hourly].each_with_index do |day, i|
      hourly_weather << HourlyWeather.new(day) if i < 8
    end

    forecast = Forecast.new(current_weather, daily_weather, hourly_weather)

    render json: ForecastSerializer.new(forecast)
  end
end

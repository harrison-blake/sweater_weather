class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.forcast_from_location(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end

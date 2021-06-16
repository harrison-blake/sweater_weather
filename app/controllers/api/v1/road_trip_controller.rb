class Api::V1::RoadTripController < ApplicationController
  def create
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route") do |request|
      request.params['key'] = ENV['map_quest_key']
      request.params['from'] = params[:road_trip][:origin]
      request.params['to'] = params[:road_trip][:destination]
    end

    directions = JSON.parse(response.body, symbolize_names: true)

    weather = ForecastFacade.get_weather_data(params[:road_trip][:destination])

    trip = RoadTrip.new(directions, weather)

    render json: RoadTripSerializer.new(trip)
  end
end

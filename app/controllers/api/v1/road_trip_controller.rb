class Api::V1::RoadTripController < ApplicationController
  def create
    if (User.find_by(api_key: params[:road_trip][:api_key]) == nil) || (params[:road_trip][:api_key] == nil)
      render json: {error: "unauthorized"}, status: 401
    else
      trip = RoadTripFacade.create_road_trip(params[:road_trip][:origin], params[:road_trip][:destination])
      render json: RoadTripSerializer.new(trip)
    end

  end
end

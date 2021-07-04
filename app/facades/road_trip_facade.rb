class RoadTripFacade
  def self.create_road_trip(origin, destination)
    directions = get_directions(origin, destination)

    # generate exception in geocode service for error handling
    # indtead of at facade AND poro level

    if directions[:info][:statuscode] != 402
      weather = ForecastFacade.get_weather_data(destination)
      trip = RoadTrip.new(directions, origin, destination, weather)
    else
      trip = RoadTrip.new(directions, origin, destination)
    end
  end

  def self.get_directions(origin, destination)
    GeocodeService.get_directions(origin, destination)
  end
end

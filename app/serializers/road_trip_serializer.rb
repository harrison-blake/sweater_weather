class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_city, :end_city, :travel_time

  attributes :weather_at_eta do |object|
    {
      temperature: object.temperature,
      conditions: object.conditions
    }
  end
end

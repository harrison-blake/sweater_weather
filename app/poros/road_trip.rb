class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(data, origin, destination, weather={})
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = get_travel_time(data)
    @temperature = weather[:current][:temp] if weather != {}
    @conditions = weather[:current][:weather][0][:description] if weather != {}
  end

  def get_travel_time(data)
    if data[:info][:statuscode] == 402
      return 'impossible'
    else
      return data[:route][:legs][0][:formattedTime]
    end
  end
end

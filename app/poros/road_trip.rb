class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(data, weather)
    @id = nil
    @start_city = concat_start_city(data)
    @end_city = concat_end_city(data)
    @travel_time = data[:route][:legs][0][:formattedTime]
    @temperature = weather[:current][:temp]
    @conditions = weather[:current][:weather][0][:description]
  end

  def concat_start_city(data)
    data[:route][:locations][0][:adminArea5] + ", " + data[:route][:locations][0][:adminArea3]
  end

  def concat_end_city(data)
    data[:route][:locations][1][:adminArea5] + ", " + data[:route][:locations][1][:adminArea3]
  end
end

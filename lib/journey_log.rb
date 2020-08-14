require_relative 'journey'

class Journey_log

attr_accessor :journeys, :journey

 def initalize(journey = Journey.new)
    @journeys = []
    @journey = journey
 end

 def start 
  @journey.start_station
 end

 def journey_push
    @journey.store_journey
    @journeys.push(@journey.store_journey)
 end

end
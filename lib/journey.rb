
class Journey

attr_accessor :start_station, :end_station, :journey

MINIMUM_FARE = 1 
PENALTY_FARE = 6

  def initialize
    @journey = nil
    @start_station
    @end_station
  end

  def store_journey
    @journey = {start_station => @start_station, end_station => @end_station}
  end

 def complete?
   !!@start_station && !!@end_station 
 end

 def fare 
   if complete? == true
     MINIMUM_FARE
   else 
     PENALTY_FARE
  end
 end

end
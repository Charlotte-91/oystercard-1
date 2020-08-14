require_relative 'journey'

class Card

  attr_accessor :balance, :journey
  
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    raise "Cannot top up: Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "insufficient funds on card" if @balance < MINIMUM_FARE
    @journey.start_station = station
  end

  def touch_out(station)
    deduct(@journey.fare) 
    @journey.end_station = station
    @journey.store_journey
  end

  
private

  def deduct(amount)
    @balance -= amount
  end

end
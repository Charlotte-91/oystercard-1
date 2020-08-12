class Card

  attr_accessor :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize

    @balance = 0

  end

  def top_up(amount)
    raise "Cannot top up: Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "insufficient funds on card" if @balance < MINIMUM_FARE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
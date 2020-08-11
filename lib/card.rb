class Card

  attr_reader :balance

  def initialize

    @balance = 0

  end

  def top_up(amount)
    raise "Cannot top up: Maximum limit is £90" if amount > 90
    @balance += amount
  end

end
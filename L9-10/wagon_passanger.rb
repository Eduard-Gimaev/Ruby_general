class WagonPassanger < Wagon
  attr_reader :seats, :available_seats
  def initialize(number, seats)
    @number = number
    @type = :passanger
    @seats = seats
    @available_seats = seats
  end

  def occupy_seat
    if @available_seats > 0
      @available_seats -= 1
    else
      fail "Sorry, there are no an available seats yet"
    end
  end

  def available_seats
    @available_seats
  end

  def occupied_seats
    @seats - @available_seats
  end
end
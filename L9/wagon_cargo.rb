class WagonCargo < Wagon
  def initialize(capacity)
    @capacity = capacity
    @free_capacity = capacity
    @type = :cargo
  end

  def fill_capacity(volume)
    if @free_capacity >= volume
      @free_capacity -= volume
    else
      fail "it's too much available capacity is #{@free_capacity}"
    end
  end

  def filled_capacity
    @capacity - @free_capacity
  end

  def available_capacity
    @free_capacity
  end

end
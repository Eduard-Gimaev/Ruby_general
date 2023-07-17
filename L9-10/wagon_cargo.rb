class WagonCargo < Wagon
  def initialize(number, total_place)
    @type = :cargo
    super
  end

  def take_place(volume)
    if @free_place >= volume
      @used_place += volume
    else
      fail "it's too much available capacity is #{@free_place}"
    end
  end
end
class WagonPassanger < Wagon
  def initialize(number, total_place)
    @type = :passanger
    super
  end

  def take_place
    if @free_place > 0
      @used_place += 1
    else
      fail "Sorry, there are no an available seats yet"
    end
  end
end
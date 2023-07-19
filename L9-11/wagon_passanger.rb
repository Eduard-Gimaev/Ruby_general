class WagonPassanger < Wagon
  def initialize(number, total_place)
    @type = :passanger
    super
  end

  def take_place
    raise 'Sorry, there are no an available seats yet' unless @free_place > 0
    @used_place += 1
  end
end

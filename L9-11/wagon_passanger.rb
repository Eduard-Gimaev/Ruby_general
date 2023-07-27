# frozen_string_literal: true

class WagonPassanger < Wagon
  def initialize(number, total_place)
    @type = :passanger
    super
  end

  def take_place
    raise 'Sorry, there are no an available seats yet' unless @free_place.positive?
    @used_place += 1
  end
end

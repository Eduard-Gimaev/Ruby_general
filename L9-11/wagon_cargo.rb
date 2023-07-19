# frozen_string_literal: true

class WagonCargo < Wagon
  def initialize(number, total_place)
    @type = :cargo
    super
  end

  def take_place(volume)
    raise "it's too much available capacity is #{@free_place}" unless @free_place >= volume

    @used_place += volume
  end
end

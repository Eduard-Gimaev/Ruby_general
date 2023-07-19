# frozen_string_literal: true

class Wagon
  include Manufacturer
  attr_reader :type, :number, :total_place, :used_place

  def initialize(number, total_place)
    @number = number
    @total_place = total_place
    @used_place = 0
    @free_place = total_place
  end

  def free_place
    @free_place = @total_place - @used_place
  end

  def take_place
    raise 'should be implemented in subclasses'
  end
end

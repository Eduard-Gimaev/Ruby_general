# frozen_string_literal: true

class TrainPassanger < Train
  def initialize(number)
    @type = :passanger
    super
  end
end

class Station
  include InstanceCounter, Validatior

  attr_reader :name, :trains
  @@stations = []

  def self.all
    @@stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
  end


  def initialize(name)
    @name = name.to_s.capitalize
    validate!
    @trains = []
    @@stations << self
    register_instance
    
  end

  def validate!
    raise ArgumentError, "Name is too short" unless self.name.length > 2
    true
  end

  def train_arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def display_trains_on_station
    @trains.each_with_index {|train, index| puts "#{index + 1}. train: number - #{train.number}; type - #{train.type}" }
  end
end
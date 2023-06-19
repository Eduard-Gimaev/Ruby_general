class Station
  include InstanceCounter

  attr_reader :name, :trains
  @@stations = []
  @@inst = 0

  def self.all
    @@stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
  end


  def initialize(name)
    @name = name.to_s.capitalize
    @trains = []
    @@stations << self
    @@inst += 1
    register_instance
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
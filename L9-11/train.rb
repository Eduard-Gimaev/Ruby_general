# frozen_string_literal: true

class Train
  include Manufacturer
  include Validation
  include InstanceCounter
  attr_reader :number, :type, :wagons

  @@trains = []

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    validate!
    @@trains << self
    register_instance
  end

  def validate!
    raise ArgumentError, 'Number is too short' unless number.length > 4
    raise ArgumentError, 'Incorrect format of the number' unless number =~ NUMBER_FORMAT

    true
  end

  def self.find(number)
    @@trains.each_with_index { |train, index| puts "#{index + 1}. #{train}" if train.number == number }
  end

  def go
    @speed = 10
  end

  def speed_up
    @speed += 10
  end

  def current_speed
    @speed
  end

  def speed_down
    @speed -= 10 if @speed.positive?
  end

  def stop
    @speed = 0
  end

  def hook_wagons(wagon)
    @wagons.insert(-1, wagon) if @speed.zero? && wagon.type == type
  end

  def unhook_wagons
    @wagons.pop
  end

  def show_wagons
    puts "The #{type} train number: #{number} has #{@wagons.length} wagon(s)"
  end

  def assign_route(route)
    @route = route
    @current_station_index = 0
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def show_current_station
    puts "Current station: #{@route.stations[@current_station_index].name}"
  end

  def show_train_route
    puts 'Train route:'
    @route.stations.each_with_index { |station, index| print "#{index + 1} - #{station.name}; " }
  end

  def move_forward
    @current_station_index += 1 if next_station
  end

  def move_back
    @current_station_index -= 1 if previous_station
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end

  def all_wagons(&block)
    @wagons.each(&block)
  end
end

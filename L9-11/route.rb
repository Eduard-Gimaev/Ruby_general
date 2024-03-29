# frozen_string_literal: true

class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(departure_point, destination_point)
    @departure_point = departure_point
    @destination_point = destination_point
    @stations = [departure_point, destination_point]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_route_stations
    puts "This route consists of #{@stations.length} station(s): "
    @stations.each_with_index { |station, index| print "#{index + 1} - #{station.name}; " }
  end
end

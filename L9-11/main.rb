# frozen_string_literal: true

require_relative 'modules'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'train_passanger'
require_relative 'train_cargo'
require_relative 'wagon'
require_relative 'wagon_cargo'
require_relative 'wagon_passanger'

class RailRoadOperator
  COMMAND = {
    1 => 'create_station', 2 => 'create_train', 3 => 'create_route', 4 => 'create_wagon',
    5 => 'add_station_to_route', 6 => 'delete_station_from_route', 7 => 'assign_route',
    8 => 'hook_wagons', 9 => 'unhook_wagons', 10 => 'train_move',
    11 => 'show_trains_on_stations', 12 => 'show_wagons_at_trains', 13 => 'exit'
  }.freeze

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def start
    loop do
      show_menu
      command = gets.chomp.to_i
      run(command)
    end
  end

  # private
  def show_menu
    menu_items = [
      'Create a station', 'Create a train', 'Create a route',
      'Create a wagon', 'Filling the route with stations',
      'Delete stations from the route', 'assign a route to the train',
      'Hook wagon to the train', 'Unhook wagons form the train',
      'Move the train forward or back along the route',
      'View trains on stations', 'View stations on stations',
      'Close menu'
    ]
    menu_items.each.with_index(1) { |item, index| puts "#{index}. #{item}" }
  end

  def run(command)
    @run = COMMAND[command] || 'there is no such command, try again'
    # case command
    # when 1 then create_station
    # when 2 then create_train
    # when 3 then create_route
    # when 4 then create_wagon
    # when 5 then add_station_to_route
    # when 6 then delete_station_from_route
    # when 7 then assign_route
    # when 8 then hook_wagons
    # when 9 then unhook_wagons
    # when 10 then train_move
    # when 11 then show_trains_on_stations
    # when 12 then show_wagons_at_trains
    # when 13 then exit
    # else
    #  puts "there is no such command, try again"
    # end
  end
end

def create_station
  puts 'Enter the name of the station:'
  name = gets.chomp.to_s.capitalize
  @stations << Station.new(name)
  puts "The station \"#{name}\" has been created"
rescue StandardError => e
  puts e
end

def create_train
  begin
    puts 'Enter the number of the train:'
    number = gets.chomp
    puts 'Enter the type of the train: cargo or passanger?'
    type = gets.chomp.capitalize
    if type == 'Cargo'
      @trains << TrainCargo.new(number)
      puts "The \"#{type}\" train with number: \"#{number}\" has been created"
    elsif type == 'Passanger'
      @trains << TrainPassanger.new(number)
      puts "The \"#{type}\" train with number: \"#{number}\" has been created"
    else
      puts 'Enter a correct type of the train'
    end
    puts 'assign manufacturer:'
    manufacturer = gets.chomp
    @trains[-1].assign_manufacturer(manufacturer)
  rescue StandardError => e
    puts e
  end
  @trains.each_with_index do |train, index|
    puts "#{index + 1}. #{train.number} - #{train.type} produced by #{train.show_manufacturer}"
  end
end

def create_route
  puts 'departure_point:'
  @departure_point = station_select
  puts 'destination_point:'
  destination_point = station_select
  @routes << Route.new(@departure_point, destination_point)
  puts "The route #{@departure_point.name} - #{destination_point.name} has been created"
end

def create_wagon
  begin
    puts 'assign manufacturer:'
    manufacturer = gets.chomp
    puts 'Enter the type of the wagon: cargo or passanger?'
    type = gets.chomp.capitalize
    puts 'Enter the number of the wagon:'
    number = gets.chomp
    if type == 'Cargo'
      puts 'Enter the capacity for this wagon:'
      total_place = gets.chomp.capitalize
      @wagons << WagonCargo.new(number, total_place)
      @wagons[-1].assign_manufacturer(manufacturer)
      puts "The \"#{type}\"(\"#{total_place}\") wagon has been created by \"#{manufacturer}\" "
    elsif type == 'Passanger'
      puts '`Enter the number of seats for this wagon:'
      total_place = gets.chomp.capitalize
      @wagons << WagonPassanger.new(number, total_place)
      @wagons[-1].assign_manufacturer(manufacturer)
      puts "The \"#{type}\"(\"#{total_place}\") wagon has been created by \"#{manufacturer}\" "
    else
      puts 'Enter a correct type of the wagon'
    end
  rescue StandardError => e
    puts e
  end
  @wagons.each_with_index { |wagon, index| puts "#{index + 1}.#{wagon.type} produced by #{wagon.show_manufacturer}" }
end

def add_station_to_route
  route = route_select
  station = station_select
  route.add_station(station)
  route.show_route_stations
end

def delete_station_from_route
  route = route_select
  station = station_select
  route.delete_station(station)
  route.show_route_stations
end

def assign_route
  train = train_select
  route = route_select
  train.assign_route(route)
  @departure_point.train_arrival(train)
  train.show_train_route
  train.show_current_station
end

def hook_wagons
  train = train_select
  wagon = wagon_select
  train.hook_wagons(wagon)
  train.show_wagons
end

def unhook_wagons
  train = train_select
  train.unhook_wagons
  train.show_wagons
end

def train_move
  train = train_select
  puts 'Train gonna move: forward(f) or back(b)?'
  direction = gets.chomp

  if direction == 'f'
    train.current_station.departure(train)
    train.move_forward
    train.current_station.train_arrival(train)
  elsif direction == 'b'
    train.current_station.departure(train)
    train.move_back
    train.current_station.train_arrival(train)
  else
    puts 'there is no such direction, try again'
  end
  train.show_current_station
  train.show_train_route
end

def show_trains_on_stations
  # via Proc
  @stations.each_with_index do |station, index|
    puts "#{index}. #{station.name}:"
    station.all_trains { |train| print " #{train.number} - #{train.type};" }
    puts ''
  end
end

# via just loop
# @stations.each_with_index do|station, index| puts "#{index}. #{station.name}:"
# station.trains.select {|train| print "#{train.number} - #{train.type};"}
# puts""
# end

def show_wagons_at_trains
  @trains.each_with_index do |train, _index|
    puts "#{train.type.capitalize} train(#{train.number}) has wagon(s):"
    train.all_wagons do |wagon|
      if wagon.type == :cargo
        puts "#{wagon.type.capitalize} wagon(#{wagon.number}) - #{wagon.free_capacity}/#{wagon.capacity} capacity"
      elsif wagon.type == :passanger
        puts "#{wagon.type.capitalize} wagon(#{wagon.number}) - #{wagon.available_seats}/#{wagon.seats} seats"
      else
        puts 'There is no any wagon at train'
      end
    end
    puts ''
  end
end

# Complementary functions for internal processes
def train_select
  puts 'Select a train:'
  @trains.each_with_index { |val, index| puts "#{index + 1}. #{val.number}-#{val.type}" }
  puts "Enter one of the #{@trains.length} train(s):"
  num = gets.chomp.to_i
  @trains[num - 1]
end

def station_select
  puts 'Select a station:'
  @stations.each_with_index { |val, index| puts "#{index + 1}. #{val.name}" }
  puts 'Enter the number of the station from the list above:'
  num = gets.chomp.to_i
  @stations[num - 1]
end

def route_select
  puts 'Select a route:'
  @routes.each_with_index { |val, index| puts "#{index + 1}. #{val.stations[0].name} - #{val.stations[-1].name}" }
  puts 'Enter number of the route:'
  num = gets.chomp.to_i
  @routes[num - 1]
end

def wagon_select
  puts 'Select a wagon:'
  @wagons.each_with_index { |val, index| puts "#{index + 1}.#{val.number}-#{val.type}" }
  num = gets.chomp.to_i
  @wagons[num - 1]
end

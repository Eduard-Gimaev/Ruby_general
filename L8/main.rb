require_relative "route"
require_relative "station"
require_relative "train"
require_relative "train_passanger"
require_relative "train_cargo"
require_relative "wagon"
require_relative "wagon_cargo"
require_relative "wagon_passanger"

class RailRoadOperator
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

  private
  def show_menu
    puts '====================================='
    puts "Insert your command: "
    puts "1. Create a station"
    puts "2. Create a train"
    puts "3. Create a route"
    puts "4. Create a wagon"
    puts "5. Filling the route with stations"
    puts "6. Delete stations from the route"
    puts "7. Set a route to the train"
    puts "8. Hook wagon to the train"
    puts "9. Unhook wagons form the train"
    puts "10. Move the train forward or back along the route"
    puts "11. View trains on stations"
    puts "12. Close menu"
  end
    
  def run(command)
    case command
    when 1 then create_station
    when 2 then create_train
    when 3 then create_route
    when 4 then create_wagon
    when 5 then add_station_to_route
    when 6 then delete_station_from_route
    when 7 then set_route
    when 8 then hook_wagons
    when 9 then unhook_wagons
    when 10 then train_move
    when 11 then show_trains_on_stations
    when 12 then exit
    else
      puts "there is no such command, try again"
    end
  end
end

#"1. Create a station"
def create_station
  puts "Enter the name of the station:"
  name = gets.chomp
  @stations << Station.new(name)
  puts "The station \"#{name}\" has been created"
  puts "List of station"
  @stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
end

#"2. Create a train"
def create_train
  puts "Enter the number of the train:"
  number = gets.chomp
  puts "`Enter the type of the train: cargo or passanger?"
  type = gets.chomp.capitalize
  if type == "Cargo"
    @trains << TrainCargo.new(number)
    puts "The \"#{type}\" train with number: \"#{number}\" has been created"
  elsif 
    type == "Passanger"
    @trains << TrainPassanger.new(number)
    puts "The \"#{type}\" train with number: \"#{number}\" has been created"
  else
    puts "Enter the correct type of the train"
  end
  @trains.each_with_index {|val, index| puts "#{index + 1}. #{val.number} - #{val.type}" }
end

#"3. Create a route"
def create_route
  puts "departure_point:"
  @departure_point = station_select
  puts "destination_point:"
  destination_point = station_select
  @routes << Route.new(@departure_point, destination_point)
  puts "The route #{@departure_point.name} - #{destination_point.name} has been created"
end

#"4. Create wagon"
def create_wagon
  @wagons << WagonCargo.new
  @wagons << WagonPassanger.new
  puts @wagons
  @wagons.each_with_index {|wagon, index| puts "#{index + 1}.#{wagon.type}" }
end

#"5. Filling the route with stations"
def add_station_to_route
  route = route_select
  station = station_select
  route.add_station(station)
  route.show_route_stations
end

#"6. Delete stations from the route"
def delete_station_from_route
  route = route_select
  station = station_select
  route.delete_station(station)
  route.show_route_stations
end

#"7. Set a route to the train"
def set_route
  train = train_select
  route = route_select
  train.set_route(route)
  @departure_point.train_arrival(train)
  train.show_train_route
  train.show_current_station
end

#"8. Hook wagon to the train"
def hook_wagons
  train = train_select
  wagon = wagon_select
  train.hook_wagons(wagon)
  train.show_wagons
end

#"9. Unhook wagons form the train"
def unhook_wagons
  train = train_select
  train.unhook_wagons
  train.show_wagons
end

#"10. Move the train forward or back along the route"
def train_move
  train = train_select
  puts "Train gonna move: forward(f) or back(b)?"
  direction = gets.chomp

  if direction == "f"
    train.current_station.departure(train)
    train.move_forward
    train.current_station.train_arrival(train)
  elsif direction == "b"
    train.current_station.departure(train)
    train.move_back
    train.current_station.train_arrival(train)
  else
    puts "there is no such direction, try again"
  end
  train.show_current_station
  train.show_train_route
end

#"11. View trains on stations"
def show_trains_on_stations
  # why station.display_trains_on_station => array @train is empty??
  @stations.each_with_index do|station, index| puts "#{station.name}:"
    station.trains.select do|train|
      print " #{train.number} - #{train.type};"
      puts""
    end
  end
end

# Complementary functions for internal processes
def train_select
  puts "This is the list of the trains:"
  @trains.each_with_index {|val, index| puts "#{index + 1}. #{val.number}" }
  puts "Enter one of the #{@trains.length} train(s):"
  num = gets.chomp.to_i
  train = @trains[num - 1]
end

def station_select
  puts "This is the list of the stations:"
  @stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
  puts "Enter the number of the station from the list above:"
  num = gets.chomp.to_i
  station = @stations[num - 1]
end

def route_select
  puts "This is the list of the routes:"
  @routes.each_with_index {|val, index| puts "#{index + 1}. #{val.stations[0].name} - #{val.stations[-1].name}" }
  puts "Enter number of the route:"
  num = gets.chomp.to_i
  route = @routes[num - 1]
end

def wagon_select
  puts "Enter the number of the type:"
  @wagons.each_with_index {|wagon, index| puts "#{index + 1}.#{wagon.type}" }
  num = gets.chomp.to_i
  wagon = @wagons[num - 1]
end
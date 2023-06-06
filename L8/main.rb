require_relative "route"
require_relative "station"
require_relative "train"
require_relative "train_passanger"
require_relative "train_cargo"

class RailRoadOperator

  def initialize(operator = "Ed")
    @operator = operator
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    command = ''

    while command != 11
      puts '====================================='
      puts "Insert your command: "
      puts "1. Create a station"
      puts "2. Create a train"
      puts "3. Create a route"
      puts "4. Filling the list of stations for the route"
      puts "5. Removing a station from the route"
      puts "6. Set a route to the train"
      puts "7. Hook wagon to the train"
      puts "8. Unhook wagons form the train"
      puts "9. Move the train along the route forward or back"
      puts "10. View the list of stations and the list of trains at the station"
      puts "11. Close menu"

      command = gets.chomp.to_i

      case command
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then add_station_to_route
      when 5 then delete_station_from_route
      when 6 then set_route
      when 7 then hook_wagons
      when 8 then unhook_wagons
      when 9 then train_move
      when 10 then show_trains_on_stations
      when 11 then break
      else
        puts "there is no such command, try again"
      end
    end
  end
end

#"1. Create a station"
def create_station
  puts "Enter the name of the station:"
  name = gets.chomp
  @stations << Station.new(name)
  puts "The station \"#{name}\" has been created"
  puts "List os station"
  @stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
end

#"2. Create a train"
def create_train
  puts "Enter the number of the train:"
  number = gets.chomp
  puts "What type of the train: cargo or passanger?"
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
  departure_point = station_by_num.name
  puts "destination_point:"
  destination_point = station_by_num.name
  @routes << Route.new(departure_point, destination_point)
  
  puts "The route \"#{departure_point}\" - \"#{destination_point}\" has been created"
  puts "This route consists of #{@routes[-1].stations} station(s)"
end

#"4. filling the list of stations for the route"
def add_station_to_route
  route = route_by_points
  station = station_by_num.name
  route.add_station(station)
  route.show_route_stations
end

#"5. Removing a station from the route"
def delete_station_from_route
  route = route_by_points
  station = station_by_num.name
  route.delete_station(station)
  route.show_route_stations
end

#"6. Set a route to the train"
def set_route
  train = train_by_num
  route = route_by_points
  train.set_route(route)
  train.show_train_route
  train.current_station
end

#"7. Hook wagon to the train"
def hook_wagons
  train = train_by_num
  train.hook_wagons
  train.show_wagons
end

#"8. Unhook wagons form the train"
def unhook_wagons
  train = train_by_num
  train.show_wagons 
  puts "which one do you want to unhook?"
  num = gets.chomp.to_i
  train.unhook_wagons(num)
  train.show_wagons
end

#"9. Move the train along the route forward or back"
def train_move
  train = train_by_num
  train.current_station
  train.show_train_route
  puts "where are you going to move: forward(f) or back(b)?"
  direction = gets.chomp

  if direction == "f"
    train.move_forward
  elsif 
    direction == "b"
    train.move_back
  else
    puts "there is no such direction, try again"
  end
  train.current_station
  train.show_train_route
end

#"10. View the list of stations and the list of trains at the station"
def show_trains_on_stations
  # why station.display_trains_on_station => array @train is empty??
  @stations.each_with_index {|station, index| puts "#{station.name}: #{station.display_trains_on_station}" }
  
  # Just for testing
  puts "============"
  @trains.each_with_index {|train, index| puts "#{train.number}: #{train.current_station}" }

end

def train_by_num
  puts "This is the list of the trains:"
  @trains.each_with_index {|val, index| puts "#{index + 1}. #{val.number}" }
  puts "Enter one of the #{@trains.length} train(s):"
  num = gets.chomp.to_i
  train = @trains[num - 1]
end

def station_by_num
  puts "This is the list of the stations:"
  @stations.each_with_index {|val, index| puts "#{index + 1}. #{val.name}" }
  puts "Enter the number of the station from the list above:"
  num = gets.chomp.to_i
  station = @stations[num - 1]
end

def route_by_points
  puts "This is the list of the routes:"
  @routes.each_with_index {|val, index| puts "#{index + 1}. #{val.stations}" }
  puts "Enter number of the route:"
  num = gets.chomp.to_i
  route = @routes[num - 1]
end
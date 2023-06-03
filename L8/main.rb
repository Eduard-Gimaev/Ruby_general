require_relative "route"
require_relative "station"
require_relative "train"
require_relative "train_passanger"
require_relative "train_cargo"

class RailRoadOperator
  attr_reader :all_stations, :all_trains, :all_routes
  def initialize(operator = "Ed")
    @operator = operator
    @all_stations = []
    @all_trains = []
    @all_routes = []

  end

  def menu
    command = ''

    while command != 9
      puts '_________________________________'
      puts "Insert your command: "
      puts "1. Create a station"
      puts "2. Create a train"
      puts "3. Create a route"
      puts "4. Determine the list of stations"
      puts "5. Set a route to the train"
      puts "6. Hook wagon to the train"
      puts "7. Unhook wagons form the train"
      puts "8. Move the train along the route forward or back"
      puts "9. View the list of stations and the list of trains at the station"
      puts "10. Close menu"

      command = gets.chomp.to_i

      case command
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then seed_route
      when 5 then set_route
      when 6 then hook_wagons
      when 7 then unhook_wagons
      when 8 then train_move
      when 9 then show_trains_on_stations
      when 10 then break
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
  @all_stations << Station.new(name)
  puts "The station \"#{name}\" has been created"
  puts "List os station"
  @all_stations.each_with_index {|val, index| puts "#{index}. #{val.name} " }
end

#"2. Create a train"
def create_train
  puts "Enter the number of the train:"
  number = gets.chomp
  puts "What type of the train: cargo or passanger?"
  type = gets.chomp.capitalize
  if type == "Cargo"
    @all_trains << TrainCargo.new(number)
    puts "The \"#{type}\" train with number: \"#{number}\" has been created"
  elsif 
    type == "Passanger"
    @all_trains << TrainPassanger.new(number)
    puts "The \"#{type}\" train with number: \"#{number}\" has been created"
  else
    puts "Enter the correct type of the train"
  end
  @all_trains.each_with_index {|val, index| puts "#{index}. #{val.number} - #{val.type}" }
end

#"3. Create a route"
def create_route
  puts "departure_point:"
  departure_point = gets.chomp
  puts "destination_point:"
  destination_point = gets.chomp
  @all_routes << Route.new(departure_point, destination_point)
  puts "The route \"#{departure_point}\" - \"#{destination_point}\" has been created"
  @all_routes.each_with_index {|val, index| puts "#{index}. #{val}" }
end

#"4. Determine the list of stations"
def seed_route
  route = route_by_points
  station = station_by_name
  route.add_station(station)
  puts "The way station #{station} has been added"
  puts "#{route}"
end

#"5. Set a route to the train"
def set_route
end

#"6. Hook wagon to the train"
def hook_wagons
  train = train_by_num
  train.hook_wagons
  puts "Perfect, we have #{train.show_wagons.length} wagon(s) now"
end

#"7. Unhook wagons form the train"
def unhook_wagons
  train = train_by_num
  puts "We have #{train.show_wagons.length} which one do you want to unhook?"
  num = gets.chomp.to_i
  train.unhook_wagons(num)
  puts "We have #{train.show_wagons.length} wagon(s) left now"
end

#"8. Move the train along the route forward or back"
def train_move
  train = train_by_num
  puts "where are you going to move: forward or back?"
  direction = gets.chomp
  if direction == forward
    train.move_forward
  elsif 
    direction == back
    train.move_forward
  else
    puts "there is no such direction, try again"
  end
end

#"9. View the list of stations and the list of trains at the station"
def show_trains_on_stations
  #@all_stations.each_with_index {|val, index| puts "#{index}. #{val.name} " }
end


def train_by_num
  puts "This is the list of the trains:"
  @all_stations.each_with_index {|val, index| puts "#{index}. #{val.number}" }
  puts "Enter one of the #{@all_trains.length} train(s):"
  num = gets.chomp.to_i
  train = @all_trains[num - 1]
end

def station_by_name
  puts "This is the list of the stations:"
  @all_stations.each_with_index {|val, index| puts "#{index}. #{val.name}" }
  puts "Enter the name of the station from the list above:"
  station = gets.chomp
end

def route_by_points
  puts "This is the list of the routes:"
  @all_routes.each_with_index {|val, index| puts "#{index}. #{val.destination_point}" }
  puts "Enter number of the route:"
  num = gets.chomp.to_i
  route = @all_routes[num - 1]
end
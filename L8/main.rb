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
      puts "3. Create a route and determine the list of stations"
      puts "4. Set a route to the train"
      puts "5. Hook wagon to the train"
      puts "6. Unhook wagons form the train"
      puts "7. Move the train along the route forward or back"
      puts "8. View the list of stations and the list of trains at the station"
      puts "9. Close menu"

      command = gets.chomp.to_i

      case command
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then set_route
      when 5 then hook_wagons
      when 6 then unhook_wagons
      when 7 then train_move
      when 8 then show_trains_on_stations
      when 9 then break
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
      puts "========="
      puts @all_stations
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
  puts @all_trains
end

#"3. Create a route and determine the list of stations"
def create_route
  puts "departure_point:"
  departure_point = gets.chomp
  puts "destination_point:"
  destination_point = gets.chomp
  @all_routes << Route.new(departure_point, destination_point)
  puts "The route \"#{departure_point}\" - \"#{destination_point}\" has been created"
  puts "========="
  puts @all_stations

end
#"4. Set a route to the train"
def set_route
end

#"5. Hook wagon to the train"
def hook_wagons
  train = train_by_num
  train.hook_wagons
  puts "Perfect, we have #{train.show_wagons.length} wagon(s) now"
end

#"6. Unhook wagons form the train"
def unhook_wagons
  train = train_by_num
  puts "We have #{train.show_wagons.length} which one do you want to unhook?"
  num = gets.chomp.to_i
  train.unhook_wagons(num)
  puts "We have #{train.show_wagons.length} wagon(s) left now"
end

#"7. Move the train along the route forward or back"
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

#"8. View the list of stations and the list of trains at the station"
def show_trains_on_stations
end


def train_by_num
  puts "We have #{@all_trains.length} train(s), choose one:"
  number = gets.chomp.to_i
  train = @all_trains[number - 1]
end

def station_by_name
  puts "We have bunch of the station: #{@all_stations.length}, choose one:"
  name = gets.chomp.to_i
  train = @all_stations[name - 1]
end

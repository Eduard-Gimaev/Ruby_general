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
      puts "7. Move the train along the route according to the station of the destination"
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


def create_station
  puts "Enter the name of the station:"
  name = gets.chomp
      @all_stations << Station.new(name)
      puts "The station \"#{name}\" has been created"
      puts "========="
      puts @all_stations
end

def create_train
  puts "Enter the number of the train:"
  number = gets.chomp
  puts "Cargo or passanger train?"
  type = gets.chomp.capitalize
  if type == "Cargo"
    @all_trains << TrainCargo.new(number)
  elsif 
    type == "Passanger"
    @all_trains << TrainPassanger.new(number)
  else
    puts "Enter the correct type of the train: cargo or passanger"
  end
  puts "The \"#{type}\" train with number: \"#{number}\" has been created"
  puts"======"
  puts "#{@all_trains}"
  puts"======"
  #@all_trains.select{|train| train.type==type}
end

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

def set_rout
end

def hook_wagons
end

def unhook_wagons
end

def train_move
  train = train_by_num
  #puts "Enter the number if the station: #{@all_stations.name}"
  #name = gets.chomp
  #station = @all_stations[name - 1]
  
  
  train.speed_up
  puts"#{train.current_speed}"
  #train.move_to_station(station)
  #puts "Train №#{@train.index(train) + 1} has been located at station: #{station.name}"
end

def show_trains_on_stations
end

def train_by_num
  puts "We have #{@all_trains.length} train(s), choose one:"
  number = gets.chomp.to_i
  train = @all_trains[number - 1]
end
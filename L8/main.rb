require_relative "route"
require_relative "station"
require_relative "train"

class RailWayManager

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

def create_station
end

def create_train
end

def create_route
end

def set_route
end

def hook_wagons
end

def unhook_wagons
end

def train_move
end

def show_trains_on_stations
end


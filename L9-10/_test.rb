require "pry"
require_relative "modules"
require_relative "main"
require_relative "route"
require_relative "station"
require_relative "train"
require_relative "train_passanger"
require_relative "train_cargo"
require_relative "wagon"
require_relative "wagon_cargo"
require_relative "wagon_passanger"


rro1 = RailRoadOperator.new
    @stations = []
    @trains = []
    @routes = []
    @wagons = []

puts "#1. Create a station"
    @stations << Station.new("Ufa")
    @stations << Station.new("Kazan")
    @stations << Station.new("Msk")
    @stations << Station.new("Minsk")
    @stations << Station.new("Berlin")
    @stations << Station.new("Amsterdam")
    @stations << Station.new("London")
    @stations << Station.new("Paris")
    @stations << Station.new("Lisbon")
    @stations << Station.new("Benidorm")
    puts "Stations:"
    Station.all
    puts ""

puts "#2. Create a train"
    @trains << TrainCargo.new("001-CC")
    @trains << TrainCargo.new("CCC-02")
    @trains << TrainPassanger.new("003PP")
    @trains << TrainPassanger.new("004-PP")
    @trains[0].set_manufacturer("T-Cargo")
    @trains[1].set_manufacturer("T-Cargo")
    @trains[2].set_manufacturer("T-Pas")
    @trains[3].set_manufacturer("T-Pas")
    puts "Test for @trains[0].Valid?: #{@trains[0].valid?}"
    puts "Test for @trains[1].Valid?: #{@trains[1].valid?}"
    puts "Test for @trains[2].Valid?: #{@trains[2].valid?}"
    puts "Test for @trains[3].Valid?: #{@trains[3].valid?}"
    puts "Trains:"
    @trains.each_with_index {|train, index| puts "#{index + 1}. #{train.number} - #{train.type} this train produced by #{train.show_manufacturer}" }
    puts "Find"
    Train.find("001-CC")
    Train.find("003-PP")
    puts ""
puts "#3. Create a route"
    @routes << Route.new(@stations[0], @stations[-1])
    @routes.each_with_index {|val, index| puts "#{index + 1}. #{val.stations[0].name} - #{val.stations[-1].name}" }
    puts ""
puts "#4. Create wagon"
    @wagons << WagonCargo.new("WC1",100)
    @wagons << WagonPassanger.new("WP1",12)
    @wagons[0].set_manufacturer("WagoCargo")
    @wagons[1].set_manufacturer("WagoPas")
    @wagons[-1].take_place
    @wagons[-1].take_place
    @wagons[-1].take_place
    @wagons[-2].take_place(40)
    puts "Wagons:" 
    @wagons.each_with_index {|wagon, index| puts "#{index + 1}) #{wagon.number}.#{wagon.type} wagon produced by #{wagon.show_manufacturer}" }
    print "seats available:"
    puts "#{@wagons[-1].free_place}"
    print "seats occupied:"
    puts "#{@wagons[-1].used_place}"
    print "capacity_filled:"
    puts "#{@wagons[-2].used_place}"
    print "capacity_available:"
    puts "#{@wagons[-2].free_place}"

puts "#5. Filling the route with stations"
    @routes[0].add_station(@stations[1])
    @routes[0].add_station(@stations[2])
    @routes[0].add_station(@stations[3])
    @routes[0].add_station(@stations[4])
    @routes[0].add_station(@stations[5])
    @routes[0].add_station(@stations[6])
    @routes[0].add_station(@stations[7])
    @routes[0].add_station(@stations[8])
    @routes[0].show_route_stations
    puts ""
puts "#6. Delete stations from the route"
    @routes[0].delete_station(@stations[8])
    @routes[0].show_route_stations
    puts ""
puts "#7. Set a route to the train"
    @trains[0].set_route(@routes[0])
    @trains[1].set_route(@routes[0])
    @trains[2].set_route(@routes[0])
    @trains[3].set_route(@routes[0])
puts "Put the particular train to the first station of the route"
    @stations[0].train_arrival(@trains[0])
    @stations[0].train_arrival(@trains[1])
    @stations[0].train_arrival(@trains[2])
    @stations[0].train_arrival(@trains[3])
    puts ""
puts "#8. Hook wagon to the train"
#Cargo
    @trains[0].hook_wagons(@wagons[0])
    @trains[1].hook_wagons(@wagons[0])
    @trains[0].hook_wagons(@wagons[0])
    @trains[1].hook_wagons(@wagons[0])
#Passanger
    @trains[2].hook_wagons(@wagons[1])
    @trains[3].hook_wagons(@wagons[1])
    @trains[2].hook_wagons(@wagons[1])
    @trains[3].hook_wagons(@wagons[1])
    @trains[2].hook_wagons(@wagons[1])
    @trains[3].hook_wagons(@wagons[1])
    @trains[0].show_wagons
    @trains[1].show_wagons
    @trains[2].show_wagons
    @trains[3].show_wagons
    puts ""
puts "#9. Unhook wagons form the train"
    @trains[0].unhook_wagons
    @trains[1].unhook_wagons
    @trains[2].unhook_wagons
    @trains[3].unhook_wagons
    @trains[0].show_wagons
    @trains[1].show_wagons
    @trains[2].show_wagons
    @trains[3].show_wagons
    puts ""
puts "#10. Move the train" 
#forward 
    @trains[1].current_station.departure(@trains[1])
    @trains[1].move_forward
    @trains[1].current_station.train_arrival(@trains[1])

    @trains[2].current_station.departure(@trains[2])
    @trains[2].move_forward
    @trains[2].current_station.train_arrival(@trains[2])

    @trains[2].current_station.departure(@trains[2])
    @trains[2].move_forward
    @trains[2].current_station.train_arrival(@trains[2])

    @trains[2].current_station.departure(@trains[2])
    @trains[2].move_forward
    @trains[2].current_station.train_arrival(@trains[2])

    @trains[3].current_station.departure(@trains[3])
    @trains[3].move_forward
    @trains[3].current_station.train_arrival(@trains[3])

    @trains[3].current_station.departure(@trains[3])
    @trains[3].move_forward
    @trains[3].current_station.train_arrival(@trains[3]) 

    @trains[3].current_station.departure(@trains[3])
    @trains[3].move_forward
    @trains[3].current_station.train_arrival(@trains[3])

    @trains[3].current_station.departure(@trains[3])
    @trains[3].move_forward
    @trains[3].current_station.train_arrival(@trains[3])
#back
    @trains[2].current_station.departure(@trains[2])
    @trains[2].move_back
    @trains[2].current_station.train_arrival(@trains[2])

    @trains[3].current_station.departure(@trains[3])
    @trains[3].move_back
    @trains[3].current_station.train_arrival(@trains[3])
 #current_station   
    @trains[0].show_current_station
    @trains[1].show_current_station
    @trains[2].show_current_station
    @trains[3].show_current_station
    puts ""
puts "#11. View trains on stations"
    #via Proc
    @stations.each_with_index do|station, index| puts "#{index + 1}. #{station.name}:"
        station.all_trains{|train| print "#{train.type.capitalize} train(#{train.number}) has #{train.wagons.length} wagon(s) ;"}
        puts""
    end

    #via just loop
    #@stations.each_with_index do|station, index| puts "#{index}. #{station.name}:"
        #station.trains.select do|train|
        #print " #{train.number} - #{train.type};"
        #puts""
        #end
    #end
puts ""
puts "#12. View wagons_at_trains"
@trains.each_with_index do|train, index| puts "#{train.type.capitalize} train(#{train.number}) has wagon(s):"
  train.all_wagons do |wagon|
    #binding.pry
    if wagon.type == :cargo
      puts "#{wagon.type.capitalize} wagon(#{wagon.number}) - #{wagon.free_place}/#{wagon.total_place} capacity"
    elsif
      wagon.type == :passanger
      puts "#{wagon.type.capitalize} wagon(#{wagon.number}) - #{wagon.free_place}/#{wagon.total_place} seats"
    else
        puts "There is no any wagon at train"
    end
  end
    puts""
end
puts""
puts "INSTATNCES"
puts "#Station"
Station.instances 
puts "#Route"
Route.instances
puts "#TrainCargo"
TrainCargo.instances
puts "#TrainPassanger"
TrainPassanger.instances








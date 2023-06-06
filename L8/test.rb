require_relative "route"
require_relative "station"
require_relative "train"
require_relative "train_passanger"
require_relative "train_cargo"

def initialize(operator = "Ed")
    @operator = operator
    @stations = []
    @trains = []
    @routes = []
  end


@stations << Station.new('Ufa')
@stations << Station.new('Moscow')
@stations << Station.new('Krasnodar')
@stations << Station.new('Volgograd')
@stations << Station.new('Samara')
@stations << Station.new('Vladimir')
@stations << Station.new('Kazan')
@stations << Station.new('Sochi')

@trains << Train.new("00011", "cargo")
@trains << Train.new("0002", "passanger")
@trains << Train.new("0003", "cargo")
@trains << Train.new("0004", "passanger")
@trains << Train.new("0005", "cargo")
@trains << Train.new("0006", "passanger")
@trains << Train.new("0007", "cargo")
@trains << Train.new("0008", "passanger")

@routes << Route.new("Ufa", "Moscow") 
@routes << Route.new("Moscow", "Ufa") 
@routes << Route.new("Ufa", "Sochi") 
@routes << Route.new("Sochi", "Ufa") 

route1.add_way_station('Krasnodar')
route1.add_way_station('Volgograd')
route1.add_way_station('Samara')
route1.add_way_station('Vladimir')
route1.add_way_station('Kazan')
route1.add_way_station('Sochi')
train1.set_route(route1)
train2.set_route(route1)
train3.set_route(route1)
train4.set_route(route1)
train5.set_route(route1)
train6.set_route(route1)
train7.set_route(route1)
train8.set_route(route1)

train1.show_train_route
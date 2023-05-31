=begin
    
=end





class Train
  attr_reader :number, :type

  def initialize(number, type)  
    @number = number
    @type = type
  end

  def go
    @speed = 10
  end

  def speed_up
    @speed += 10
  end

  def current_speed
    @speed
  end

  def speed_down
    @speed -= 10 if @speed > 0
  end

  def stop
    @speed = 0
  end

  def hook_wagons
    @wagons = 0
    @wagons = @wagons + 1 if @speed == 0
  end

  def unhook_wagons
    @wagons -= 1 if @wagons >= 0 || @speed == 0
  end

  def show_wagons
    @wagons
  end

  def set_route(route)
    @route = route
    @current_station_index = 0
  end

  def show_train_route
    @route.stations
  end

  def move_forward
    @current_station_index += 1 if next_station
  end

  def move_back
    @current_station_index -= 1 if previous_station
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

def previous_station
    @route.stations[@current_station_index - 1]
  end

#for testing only
  def location
    puts"previous: #{@route.stations[@current_station_index - 1]}"
    puts"current: #{@route.stations[@current_station_index]}"
    puts"next: #{@route.stations[@current_station_index + 1]}"
  end
end

station1 = Station.new('Ufa')
station2 = Station.new('Moscow')
station3 = Station.new('Krasnodar')
station4 = Station.new('Volgograd')
station5 = Station.new('Samara')
station6 = Station.new('Vladimir')
station7 = Station.new('Kazan')
station8 = Station.new('Sochi')
station8 = Station.new('Nigniynovgorod')

train1 = Train.new("0001", "cargo")
train2 = Train.new("0002", "passanger")

route1 = Route.new("Ufa", "Moscow") 
route2 = Route.new("Moscow", "Ufa") 
route3 = Route.new("Ufa", "Sochi") 
route4 = Route.new("Sochi", "Ufa") 

route1.add_way_station('Kazan')
route1.add_way_station('Vladimir')
route1.add_way_station('Nigniynovgorod')
train1.set_route(route1)
train1.show_train_route
train1.move_back
train1.location #just for testing
station1.train_arrival(train1)
station1.train_arrival(train2)
station1.show_trains_by_type("cargo")




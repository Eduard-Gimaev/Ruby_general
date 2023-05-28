=begin
    Класс Station (Станция):
+Имеет название, которое указывается при ее создании
+Может принимать поезда (по одному за раз)
+Может возвращать список всех поездов на станции, находящиеся в текущий момент
+Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
+Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

Класс Route (Маршрут):
 + Имеет начальную и конечную станцию, а также список промежуточных станций. 
 + Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
 + Может добавлять промежуточную станцию в список
 + Может удалять промежуточную станцию из списка
 + Может выводить список всех станций по-порядку от начальной до конечной

Класс Train (Поезд):
+ Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
+ Может набирать скорость
+ Может возвращать текущую скорость
+ Может тормозить (сбрасывать скорость до нуля)
+ Может возвращать количество вагонов
+ Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
+ Прицепка/отцепка      вагонов может осуществляться только если поезд не движется.
+ Может принимать маршрут следования (объект класса Route). 
+ При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
+ Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
+ Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name 
    @trains = []
  end

  def train_arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def show_trains_by_type(type)
    @trains.select{|train| train.type == type}
  end
end

class Route
  attr_reader :route, :stations

  def initialize(departure_point, destination_point)
    @departure_point = departure_point
    @destination_point = destination_point
    @stations = [departure_point, destination_point]
  end

  def add_way_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_route_stations
    @stations
  end
end

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




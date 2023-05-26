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
    attr_reader :station_name
    attr_accessor :trains

    def initialize(station_name)
        @station_name = station_name 
        @trains = {}
        @trains_on_the_station = []
        @train_type = []
    end

    def train_arrival(train_number, train_type, wagons)
        @trains_on_the_station << train_number
        @train_type << train_type
        #@trains[train_number] = {train_type: train_type, wagons: wagons} # just in case
    end

    def show_trains_on_the_station
        @trains_on_the_station.each do|number| 
            puts "#{number}"
        end
    end

    def show_train_types
        @train_type.each do|type| 
            puts "#{type}"
        end
    end
    
    def departure(train_number)
        @trains_on_station.delete(train_number)
    end
end

class Route
    attr_reader :route
    attr_reader :stations
    def initialize(departure_point, destination_point)
        @departure_point = departure_point
        @destination_point = destination_point
        @stations = [departure_point, destination_point]
    end
    def add_way_station(station)
            @stations.insert(-2, station)
    end
    def exclude_station(station)
        @stations.delete(station)
      end
    def show_route_stations
        print "this route has following stations: #{@stations}"
    end
end

class Train
    attr_reader :train_number
    attr_accessor :train_type
    attr_accessor :wagons
    attr_accessor :speed
    attr_accessor :current_station


    def initialize(train_number, train_type)
        @train_number = train_number
        @train_type = train_type
        @wagons = 0
        @speed = 0
        @routes = []
        @current_route = 0
        @current_station = 0
    end
    def go
        self.speed = 10
    end
    def speed_up
        self.speed += 10
    end
    def show_speed
        puts "current speed: #{@speed}"
    end
    def speed_down
        if @speed == 0
            puts "speed down is unavailable, due to the train has been already stoped"
        self.speed -= 10
        end
    end
    def stop #added just in case
        self.speed = 0
    end
    def hook_wagons
        self.wagons += 1 if @speed == 0
        puts "the wagon hooked successfully"
    end
    def unhook_wagons
        if @wagons <= 0 || @speed == 0
            puts "unhooking is unavailable"
        else
            @wagons -= 1 
            puts "the unhooking of the wagon was successful"
        end
    end
    def show_wagons
        puts "current number of the wagons: #{@wagons}"
    end
    
    def set_route(route)
        @routes << route
        @current_station = route.stations[0]
        puts "#{@current_station}"

    end
    def show_train_route
        @routes.each {|station| puts station.route}
    end

    def move_forward(route)
        a = route.stations.index(@current_station) + 1
        b = route.stations.length-1
        if a > b
            puts "this is the last station"
        else
            @current_station = route.stations[a]
        end
        
        #@current_station = @next_station

    end
    def move_back(route)
        c = route.stations.index(@current_station) - 1
        if c < 0
            puts "this is the first station"
        else
            @current_station = route.stations[c]
        end
        
    end
    def show_current_location(route)
        puts "Dear passangers!"

        puts "At the moment our station is: #{@current_station}"

        c = route.stations.index(@current_station) - 1
        if c < 0
            puts "This is the first station, please be ready for the departure"
        else
            previous_station = route.stations[route.stations.index(@current_station) - 1] 
            puts "The previous station was: #{previous_station}"
        end
        a = route.stations.index(@current_station) + 1
        b = route.stations.length-1
        if a > b
            puts "This is the last station, please check all your belongings with you"
        else
            next_station = route.stations[route.stations.index(@current_station) + 1]
            puts "The next station will be: #{next_station}"
        end

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
train1.move_back(route1)
train1.show_current_location(route1)




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
  Может принимать маршрут следования (объект класса Route). 
  При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

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
    def initialize(departure_point, destination_point)
        @departure_point = departure_point
        @destination_point = destination_point
        @route = [departure_point, destination_point]
    end
    def add_way_station(station)
            @route.insert(-2, station)
    end
    def exclude_station(station)
        @route.delete(station)
      end
    def show_route
        @route.each {|station| print "this route has following stations: #{station}, "} 
    end
end

class Train
    attr_reader :train_number
    attr_accessor :train_type
    attr_accessor :wagons
    attr_accessor :speed

    def initialize(train_number, train_type)
        @train_number = train_number
        @train_type = train_type
        @wagons = 0
        @speed = 0
        @routes = []
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
    end
    def show_route
        @routes.each {|station| puts station.route}
    end

    def move_forward(station)
        @move_forward = @route[@route.index(@current_station) + 1]
    end
    def move_back(station)
        @move_back = @route[@route.index(@current_station) - 1]
    end
    def show_current_location
        puts "Dear passangers!"
        puts "Our train follows from #{@move_back} station to #{@move_forward} station"
        puts "At the moment our train is located at #{@current_station} station"
    end
end
class Route
    attr_reader :route, :stations
  
    def initialize(departure_point, destination_point)
      @departure_point = departure_point
      @destination_point = destination_point
      @stations = [departure_point, destination_point]
    end
  
    def add_station(station)
      @stations.insert(-2, station)
    end
  
    def delete_station(station)
      @stations.delete(station)
    end
  
    def show_route_stations
      @stations
    end
  end
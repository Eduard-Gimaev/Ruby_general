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
  end
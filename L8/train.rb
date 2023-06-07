class Train
  attr_reader :number, :type, :wagons

  def initialize(number, type)  
    @number = number
    @type = type
    @speed = 0
    @wagons = []
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
    @wagons << @type if @speed == 0
  end

  def unhook_wagons(num)
    @wagons.delete_at(num)
  end

  def show_wagons
    puts "Train has #{@wagons.length} wagon(s)"
  end

  def set_route(route)
    @route = route
    @current_station_index = 0
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def show_current_station
    puts "Current station: #{@route.stations[@current_station_index].name}"
  end

  def show_train_route
    #@stations.each_with_index {|station, index| print "#{index + 1} - #{station.name}; " }
    puts "Train route:" 
    @route.stations.each_with_index {|station, index| print "#{index + 1} - #{station.name}; "}
    puts " "
  end

  def move_forward
      @current_station_index += 1 if next_station
  end

  def move_back
      @current_station_index -= 1 if previous_station
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end
end
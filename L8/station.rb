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
  
    def display_trains_on_station
      puts "QT: #{@trains} "
    end
  end
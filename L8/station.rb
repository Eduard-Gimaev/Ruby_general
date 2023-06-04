class Station
    attr_reader :name, :trains
  
    def initialize(name = Ufa)
      @name = name 
      @trains = []
    end
  
    def train_arrival(train)
      @trains << train
    end
  
    def departure(train)
      @trains.delete(train)
    end
  
    def show_trains_on_station
      @trains.each_with_index {|val, index| puts "#{index + 1}. #{val.number} - #{val.type}" }
    end
  end
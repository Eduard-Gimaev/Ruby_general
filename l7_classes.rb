=begin
=end

class Station
    def initialize(station_name)
        @station_name  = station_name 
        
    end

end

class Rout

    def initialize(first_stiation, last_station)
        @first_stiation = first_stiation
        @last_station = last_station
    end
    
end


class Train
    def initialize(train_num, train_type, train_wagons)
        @train_num = train_num
        @train_type = train_type
        @train_wagons =train_wagons
    end


end
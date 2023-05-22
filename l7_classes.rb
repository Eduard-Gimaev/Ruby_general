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
    def initialize
        @train_num = 012345
        @train_type = cargo
    end


end
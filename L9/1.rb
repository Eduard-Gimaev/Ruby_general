class Train 
    def initialize(number) 
        @number = number 
        validate! 
    end 
    def validate! 
        raise "not valid format" 
        unless ["passenger", "cargo"].include?(@number) 
    end 
end 

class Interface 
    def initialize 
        @trains = [] 
    end 
    def create_train 
        begin puts "train number:" 
            number = gets.chomp 
            train = Train.new(number) 
            @trains << train 
        rescue => e 
            puts e 
        end 
    end 
end 
Interface.new.create_train 
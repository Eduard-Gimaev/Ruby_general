
class TrainPassanger < Train
    private
    def initialize (name, type = "passanger")
        @type = type
        super
    end

end

class TrainCargo < Train
    private
    def initialize (number)
        @type = :cargo
        super
    end
end
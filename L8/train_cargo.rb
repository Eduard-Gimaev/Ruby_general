class TrainCargo < Train
    def initialize (name, type = "cargo")
        @type = type
        super
    end
end
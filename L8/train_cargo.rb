class TrainCargo < Train
    private
    def initialize (name, type = "cargo")
        @type = type
        super
    end
end
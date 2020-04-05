class Meal

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :waiter, :customer, :total, :tip

    def initialize(waiter, customer, total, tip=0)
        @waiter, @customer, @total, @tip = waiter, customer, total, tip
        @@all << self
    end

end
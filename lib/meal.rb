class Meal

    attr_accessor :waiter, :customer, :tip, :total
    @@all = []
    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @@all << self
        @tip = tip
    end

    def self.all
        @@all
    end
    
end
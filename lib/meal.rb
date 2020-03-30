class Meal
    attr_accessor :customer, :waiter, :total, :tip 
    @@all = [] 
    def self.all 
        @@all 
    end
    
    def initialize(customer, waiter, total, tip = 0) 
        @customer = customer 
        @waiter = waiter 
        @total = total 
        @tip = tip 
        @@all << self
    end


end
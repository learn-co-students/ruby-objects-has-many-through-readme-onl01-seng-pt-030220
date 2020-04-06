class Meal
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  attr_accessor :customer, :waiter, :total, :tip 
  
  def initialize(customer, waiter, total, tip = 0)
    @customer, @waiter, @total, @tip = customer, waiter, total, tip 
    @@all << self 
  end 
  
end
class Customer
  attr_accessor :name, :age 
  @@all = [] 

  def self.all 
    @@all 
  end 

  def initialize(name, age)
    @name = name 
    @age = age 
    @@all << self 
  end

  def new_meal(waiter, total, tip)
    Meal.new(self, waiter, total, tip)
  end

  def meals 
    Meal.all.select{|a| a.customer == self}
  end

  def waiters
    meals.map do |a| 
        a.waiter 
    end 
    # goes into the meals method above (whic returns to us all the meals that the customer has had, which within it also has waiters)
    # we then take out all the waiters from there. 
  end 

end
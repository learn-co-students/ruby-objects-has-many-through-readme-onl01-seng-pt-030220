class Waiter
  @@all = []
  
  def self.all 
    @@all
  end 
  
  attr_accessor :name, :yrs_of_exp
  
  def initialize(name, yrs_of_exp)
    @name, @yrs_of_exp = name, yrs_of_exp
    @@all << self 
  end
  
  def new_meal(customer, total, tip = 0)
    Meal.new(customer, self, total, tip)
  end 
  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self 
    end 
  end 
  
def best_tipper
  best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end
 
    best_tipped_meal.customer
  end 


end


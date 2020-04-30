class Waiter
  
  attr_accessor :name, :years_experience
  
  @@all= []
  
  def initialize(name,years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end
  
  def best_tipper
    best_tip = 0
        best_tipper = nil
        meals.each do |customer|
            if customer.tip > best_tip
                best_tip = customer.tip
                best_tipper = customer
            end
        end
      best_tipper.customer
    end
end
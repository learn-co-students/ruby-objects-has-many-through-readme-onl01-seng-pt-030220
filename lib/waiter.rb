
class Waiter

  attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

def meals
  Meal.all.select do |meal|
    meal.waiter == self
  end
end

  def best_tipper
    best_tip = 0
    great_tipper = nil
    meals.each do |customer|
      if customer.tip > best_tip
        best_tip = customer.tip
        great_tipper = customer.customer
      end
    end
    great_tipper
  end


end

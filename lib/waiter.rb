class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  #=> [#<Meal:0x00007fa23f1575a0
  #    @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>,
  #    @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

  

end

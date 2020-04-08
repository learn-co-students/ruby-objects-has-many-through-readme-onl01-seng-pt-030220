class Waiter

  attr_accessor :name, :years

  @@all = []

  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end

  def self.all
    @@all
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def customers
    meals.map do |meal|
      meal.customer
    end
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def best_tipper
    best_tip = 0
    best_customer = nil
    meals.each do |meal|
      if meal.tip > best_tip
        best_tip = meal.tip
        best_customer = meal.customer
      end
    end
    best_customer
  end

  end

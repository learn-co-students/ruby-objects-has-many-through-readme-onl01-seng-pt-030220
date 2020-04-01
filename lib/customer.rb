require 'pry'
class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end

  def self.oldest_customer
    oldest_age = 0
    oldest_customer = nil
    self.all.each do |customer|
      if customer.age > oldest_age
        oldest_age = customer_age
        oldest_customer = customer.name
      end
    end
    oldest_customer
  end

end

# sam = Customer.new("Sam", 27)
# binding.pry
# pat = Waiter.new("Pat", 2)
# alex = Waiter.new("Alex", 5)

# sam.new_meal(pat, 50, 10) # A Customer creates a Meal, passing in a Waiter instance
# sam.new_meal(alex, 20, 3) # A Customer creates a Meal, passing in a Waiter instance
# pat.new_meal(sam, 30, 5) # A Waiter creates a Meal, passing in a Customer instance

# ========================


# alex = Customer.new("Alex", 30)
# rachel = Customer.new("Rachel", 27)
# dan = Waiter.new("Dan", 3)

# rachel.new_meal(dan, 50, 10)
# alex.new_meal(dan, 30, 5)

# rachel.meals #=> [#<Meal:0x00007fa23f1575a0 @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>, @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]

# rachel.meals.length #=> 1

# Meal.all.length #=> 2

# ========================

# terrance = Customer.new("Terrance", 27)
# jason = Waiter.new("Jason", 4)
# andrew = Waiter.new("Andrew", 7)
# yomi = Waiter.new("Yomi", 10)

# terrance.new_meal(jason, 50, 6)
# terrance.new_meal(andrew, 60, 8)
# terrance.new_meal(yomi, 30, 4)

# terrance.waiters #=> [#<Waiter:0x00007fa23f18f860 @name="Jason", @yrs_experience=34>, #<Waiter:0x00007fa23f196818 @name="Andrew", @yrs_experience=27>, #<Waiter:0x00007fa23f19dd20 @name="Yomi", @yrs_experience=20>]

# terrance.waiters.length #=> 3

# terrance.waiters.last.name #=> "Yomi"
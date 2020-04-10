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
    Meal.all.select do |meal| # select 条件を満たすアイテムを取り出す
      meal.customer == self
    end
  end
  #=> [#<Meal:0x00007fa23f1575a0
  #    @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>,
  #    @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]

  def waiters
      meals.map do |meal| # map / collect 特定の情報を取り出す
        meal.waiter
      end
  end
   #=> [#<Waiter:0x00007fa23f18f860 @name="Jason", @yrs_experience=34>,
        #<Waiter:0x00007fa23f196818 @name="Andrew", @yrs_experience=27>,
        #<Waiter:0x00007fa23f19dd20 @name="Yomi", @yrs_experience=20>]

    def new_meal_20_percent(waiter, total)
      tip = total * 0.2
      Meal.new(waiter, self, total, tip)
    end

    def self.oldest_customer
      oldest_age = 0
      oldest_customer = nil
      self.all.each do |customer|
        if customer.age > oldest_age
          oldest_age = customer.age
          oldest_customer = customer
        end
        oldest_customer
      end
    end
end

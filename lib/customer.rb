class Customer

    @@all = []

    def self.all
        @@all
    end
    attr_accessor :name, :age
  
    def initialize(name, age)
    @name = name
    @age  = age
    @@all << self
    end
    # Building on the Relationship

    def new_meal(waiter, total, tip)
        # customer can create a meal
        # self is a reference to the current instance of customer using this method
        # this method will automatically associate each new meal with the customer that created it
        # we can pass in an instance of a waiter!!!!
        Meal.new(waiter, self, total, tip)
    end

    def meals
        # customer is going to look at all of the meals, and then select only the ones that belong to them
        # We're iterating through every instance of Meal and returning only the ones where the meal's customer matches the current customer instance
        # will return an array of all the current instance meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters
            # this method uses the #meals method above and takes it's return value (array of customers ) and returns all the waiters the customer has had
        meals.map do |meal|
            meal.waiter
        end
    end

end
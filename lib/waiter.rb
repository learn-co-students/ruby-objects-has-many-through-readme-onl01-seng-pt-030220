class Waiter

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name, :yrs_experience

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    # Building on the Relationship

    def new_meal(customer, total, tip)
        # waiter can create a meal
        # self is a reference to the current instance of waiter using this method
        # this method will automatically associate each new meal with the waiter that created it
        # we can pass in an instance of a customer!!!!
        Meal.new(self, customer, total, tip)
    end

    def meals
        # waiter is going to look at all of the meals, and then select only the ones that belong to them
        # We're iterating through every instance of Meal and returning only the ones where the meal's waiter matches the current waiter instance
        # will return an array of all the current instance meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        # this method uses the #meals method above and takes it's return value (array of waiter) and returns all the customers the waiter has had
        # iterate over the meals array compare tips and store that value in a variable
        # create a variable that holds the highest tip (value)
        # return that variable showing the customer that tips the best
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end
    
end
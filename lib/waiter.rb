class Waiter
attr_accessor :name, :age, :years_experience 
@@all = [] 

def self.all 
    @@all 
end

def initialize(name, years_experience)
    @name = name 
    @age = age 
    @years_experience = years_experience
    @@all << self 
end

def new_meal(customer, total, tip)
    Meal.new(customer, self , total,tip)
end

def meals 
Meal.all.select do |a|
    a.waiter == self 
end
end 

def best_tipper 
    money = meals.max do |a,b|
        a.tip <=> b.tip 
    end

    money.customer
end

end
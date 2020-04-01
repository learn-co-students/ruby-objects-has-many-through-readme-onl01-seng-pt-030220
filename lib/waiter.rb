require "pry"
class Waiter

  attr_accessor :name,:year_experience

  @@all=[]

  def initialize(name,year_experience)
      @name=name
      @year_experience=year_experience
      @@all << self
  end

  def self.all
      @@all
  end

  def new_meal(customer,total,tip=0)
      Meal.new(self,customer,total,tip)
  end

  def meals
     Meal.all.select { |meal| meal.waiter == self }
  end


  def best_tipper

    meal_h_tip = meals.max do |meal1,meal2|
      meal1.tip <=> meal2.tip
     end
   meal_h_tip.customer
  end


end
  #binding.pry

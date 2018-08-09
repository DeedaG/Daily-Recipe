#CLI controller

class DailyRecipe::CLI


  def call
    DailyRecipe::Recipe.today
    days_vegan
    list_recipes
    choose_recipe
    enjoy
  end

  def days_vegan
    puts "How many days have you been eating vegan?  Enter 1 -30."
    @days = gets.strip.to_i
    if @days > 30
       puts "Congratulations!  You're a vegan."
    end
  end

  def list_recipes
    if @days < 31
      puts "Today's Recipe Choices"
      @recipes = DailyRecipe::Recipe.recipes_by_day(@days)
      @recipes.each.with_index(1) do |recipe, i|
        puts "#{i}. #{recipe.title}"
        #binding.pry
      end
    end
  end

  #added a description of the chosen recipe
  def choose_recipe
    input = nil
    while input != "exit"
      puts "Enter a number for your favorite recipe, or exit to end."
      input = gets.strip.downcase

      if input.to_i > 0
        todays_recipe = @recipes[input.to_i - 1]
        puts "#{todays_recipe.title}

        #{todays_recipe.description}

        #{todays_recipe.link} "
      end
    end
  end


  def enjoy
    puts "Enjoy your meal!"
  end
end

class DailyRecipe::Recipe

attr_accessor :title, :link, :description, :day

  @@all = []

  def self.all
    @@all
  end

  def self.today
    self.scrape_recipes
  end

  #this method shovels recipe information from two websites into an array that can be manipulated
  def self.scrape_recipes
    #recipes = []
    self.scrape_foodandwine
    self.scrape_realsimple
    #recipes
  end

  # scraping recipes and information from food and wine
  #improved spacing in code and scraping
  def self.scrape_foodandwine
    doc = Nokogiri::HTML(open("https://www.foodandwine.com/special-diets/vegan/vegan-recipes"))
    counter = 0
    30.times do
      title = doc.search("a.headline-link")[counter].text.split(":")[1].strip
      recipe = self.new
      recipe.title = title
      recipe.day = counter + 1
      recipe.link = doc.css(".caption.margin-24-bottom a")[counter].attribute("href").value
      recipe.description = doc.css(".caption.margin-24-bottom")[counter].text.strip.split("\r\n").each(&:lstrip!)[0]
      @@all << recipe
      counter += 1
    end

  end

  #scraping real simple web page for recipes and information
  #improved spacing in code and scraping
  def self.scrape_realsimple
    doc = Nokogiri::HTML(open("https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"))
    counter = 0
    30.times do
      title = doc.search("div.media-body.clearfix h2")[counter].text.strip.split("\n").each_slice(2).map(&:first).each(&:lstrip!)[0]
      recipe = self.new
      recipe.title = title
      recipe.day = counter + 1
      recipe.link = "https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"
      recipe.description = doc.css(".caption.margin-24-bottom")[counter].text.strip.split("\r\n")[0]
      @@all << recipe
      counter += 1
    end

  end

    #recipe.title = doc.search("div.media-body.clearfix h2").text.strip.split("\n").each_slice(2).map(&:first).each(&:lstrip!)
    #recipe.link = "https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"
    #recipe.description = doc.css(".caption.margin-24-bottom").text.strip.split("\r\n")
    #recipe

  def self.recipes_by_day(day)
    self.all.select do |recipe|
      recipe.day == day
    end
  end
end

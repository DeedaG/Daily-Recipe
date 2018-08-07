class DailyRecipe::Recipe

attr_accessor :title, :link, :description

  def self.today
    self.scrape_recipes
  end

  #this method shovels recipe information from two websites into an array that can be manipulated
  def self.scrape_recipes
    recipes = []

    recipes << self.scrape_foodandwine
    recipes << self.scrape_realsimple

    recipes
  end

  # scraping recipes and information from food and wine
  #corrected spacing
  def self.scrape_foodandwine
    doc = Nokogiri::HTML(open("https://www.foodandwine.com/special-diets/vegan/vegan-recipes"))

    recipe = self.new
    recipe.title = doc.search("a.headline-link").text.strip.split(":")
    recipe.link = doc.css(".caption.margin-24-bottom a").attribute("href").value
    recipe.description = doc.css(".caption.margin-24-bottom").text.strip.split("\r\n")
    recipe

  end

  #scraping real simple web page for recipes and information
  #corrected spacing
  def self.scrape_realsimple

    doc = Nokogiri::HTML(open("https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"))

    recipe = self.new
    recipe.title = doc.search("div.media-body.clearfix h2").text.strip.split("\n").each_slice(2).map(&:first)
    recipe.link = "https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"
    recipe.description = doc.css(".caption.margin-24-bottom").text.strip.split("\r\n")
    recipe

  end
end

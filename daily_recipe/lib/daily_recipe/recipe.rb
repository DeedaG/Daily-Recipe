class DailyRecipe::Recipe

attr_accessor :title, :directions


  def self.today

    self.scrape_recipes
  end

  def self.scrape_recipes
    recipes = []

    recipes << self.scrape_foodandwine
    recipes << self.scrape_realsimple

    recipes
  end

  def self.scrape_foodandwine
    #@days = DailyRecipe::CLI.days_vegan.to_i
    doc = Nokogiri::HTML(open("https://www.foodandwine.com/special-diets/vegan/vegan-recipes"))

    recipe = self.new

    recipe.title = doc.search("a.headline-link").text.strip.split(":")
      #.split(",").map {|s| s.gsub!(/\d+/,",") }
    recipe.directions = doc.css(".caption.margin-24-bottom a").attribute("href").value
    #recipe.ingredients =
    recipe

  end

  def self.scrape_realsimple

    doc = Nokogiri::HTML(open("https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"))

    recipe = self.new
    recipe.title = doc.search("div.media-body.clearfix h2").text.strip.split("\n").each_slice(2).map(&:first)

    recipe.directions = "https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"
    #doc.css(".caption.margin-24-bottom a").attribute("href").value

    #recipe.ingredients =
    recipe

  end
end

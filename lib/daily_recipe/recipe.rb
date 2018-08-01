class DailyRecipe::Recipe

attr_accessor :title, :link, :description


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
    recipe.link = doc.css(".caption.margin-24-bottom a").attribute("href").value
    recipe.description = doc.css(".caption.margin-24-bottom").text.strip.split("\r\n")
    recipe

  end

  def self.scrape_realsimple

    doc = Nokogiri::HTML(open("https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"))

    recipe = self.new
    recipe.title = doc.search("div.media-body.clearfix h2").text.strip.split("\n").each_slice(2).map(&:first)

    recipe.link = "https://www.realsimple.com/food-recipes/recipe-collections-favorites/healthy-meals/vegetarian-recipes"
    #doc.css(".caption.margin-24-bottom a").attribute("href").value
    recipe.description = doc.css(".caption.margin-24-bottom").text.strip.split("\r\n")
    recipe

  end
end

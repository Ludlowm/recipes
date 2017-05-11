require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/recipes") do
  name = params.fetch("recipe_name")
  Recipe.create({:name => name})
  redirect("/recipes")
end

post("/ingredients") do
  name = params.fetch("ingredient_name")
  Ingredient.create({:name => name})
  redirect("/ingredients")
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe_ingredients = @recipe.ingredients
  @unassigned_ingredients = Ingredient.all.to_a.keep_if{|ingredient| !@recipe_ingredients.include?(ingredient)}
  erb(:recipe)
end

get("/ingredients/:id") do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredient_recipes = @ingredient.recipes
  @unassigned_recipes = Recipe.all.to_a.keep_if{|recipe| !@ingredient_recipes.include?(recipe)}
  erb(:ingredient)
end

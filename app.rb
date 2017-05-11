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
  @unassigned_ingredients = Ingredient.includes(:recipes).where(:ingredients_recipes => {:recipe_id => nil})
  erb(:recipe)
end

get("/ingredients/:id") do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredient_recipes = @ingredient.recipes
  @unassigned_recipes = Recipe.includes(:ingredients).where(:ingredients_recipes => {:ingredient_id => nil})
  erb(:ingredient)
end

patch("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  ingredients_to_add = params.fetch('ingredients_to_add',[])
  ingredients_to_delete = params.fetch('ingredients_to_delete',[])
  ingredients_to_add.each do |id|
    @recipe.ingredients.push(Ingredient.find(id))
  end
  ingredients_to_delete.each do |id|
    @recipe.ingredients.destroy(Ingredient.find(id))
  end
  redirect back
end

patch("/ingredients/:id") do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  recipes_to_add = params.fetch('recipes_to_add', [])
  recipes_to_delete = params.fetch('recipes_to_delete', [])
  recipes_to_add.each do |id|
    @ingredient.recipes.push(Recipe.find(id))
  end
  recipes_to_delete.each do |id|
    @ingredient.recipes.destroy(Recipe.find(id))
  end
  redirect back
end

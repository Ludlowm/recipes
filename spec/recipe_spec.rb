require "spec_helper"

describe(Recipe) do
  it("can have an ingredient") do
    test_recipe = Recipe.new(name: "Pasta with tomato")
    test_ingredient = test_recipe.ingredients.new(name: "Tomato")
    expect(test_recipe.ingredients()).to(eq([test_ingredient]))
  end

  it("can have multiple ingredients") do
    test_recipe = Recipe.new(name: "Tomato")
    test_ingredient1 = test_recipe.ingredients.new(name: "Tomato")
    test_ingredient2 = test_recipe.ingredients.new(name: "Chicken")
    expect(test_recipe.ingredients()).to(eq([test_ingredient1,test_ingredient2]))
  end
end

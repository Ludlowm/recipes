require "spec_helper"

describe(Ingredient) do
  it("can have a recipe") do
    test_ingredient1 = Ingredient.new(name: "Tomato")
    test_recipe = test_ingredient1.recipes.new(name: "pasta with tomato")
    expect(test_ingredient1.recipes()).to(eq([test_recipe]))
  end

  it("can have multiple recipes") do
    test_ingredient1 = Ingredient.new(name: "Tomato")
    test_recipe1 = test_ingredient1.recipes.new(name: "pasta with tomato")
    test_recipe2 = test_ingredient1.recipes.new(name: "chicken and tomato")
    expect(test_ingredient1.recipes()).to(eq([test_recipe1,test_recipe2]))
  end
end

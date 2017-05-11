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

  it("validates presence of ingredient name") do
    test_ingredient = Recipe.new({:name => ""})
    expect(test_ingredient.save()).to(eq(false))
  end

  it("ensures the length of ingredient name is at most 50 characters") do
    test_ingredient = Ingredient.new({:name => "a".*(51)})
    expect(test_ingredient.save()).to(eq(false))
  end

  it("converts the name to lowercase") do
    test_ingredient = Ingredient.create({:name => "FINAGLE THE BUFFALO"})
    expect(test_ingredient.name()).to(eq("finagle the buffalo"))
  end
end

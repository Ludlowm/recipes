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

  it("validates presence of recipe name") do
    test_recipe = Recipe.new({:name => ""})
    expect(test_recipe.save()).to(eq(false))
  end

  it("ensures the length of recipe name is at most 50 characters") do
    test_recipe = Recipe.new({:name => "a".*(51)})
    expect(test_recipe.save()).to(eq(false))
  end

  it("converts the name to lowercase and uppercases the first letter") do
    test_recipe = Recipe.create({:name => "FINAGLE THE BUFFALO"})
    expect(test_recipe.name()).to(eq("finagle the buffalo"))
  end
end

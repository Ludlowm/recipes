require "capybara/rspec"
require "./app"
require "spec_helper"

describe("describes index path", {:type => :feature}) do

  it("tests that the homepage works'") do
    visit("/")
    expect(page).to(have_content("View Recipes"))
  end


  it("tests that the homepage works'") do
    visit("/")
    click_link('View Recipes')
    expect(page).to(have_content("Add a recipe:"))

end
  it("tests adding a recipe'") do
    visit("/")
    click_link('View Recipes')
    fill_in('recipe_name', :with => 'Pizza')
    click_button('Add Recipe')
    expect(page).to(have_content("Pizza"))
  end


end

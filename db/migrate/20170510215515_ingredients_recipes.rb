class IngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredients_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end
  end
end

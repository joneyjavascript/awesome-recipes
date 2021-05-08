class AddActiveToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :active, :bool
  end
end

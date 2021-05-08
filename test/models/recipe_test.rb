require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "Recipe must have title" do
    recipe = Recipe.new
    assert_not recipe.save
  end
end

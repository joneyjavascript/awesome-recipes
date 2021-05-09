require "test_helper"

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get api_v1_recipes_resources_url
    assert_response :success
  end
end

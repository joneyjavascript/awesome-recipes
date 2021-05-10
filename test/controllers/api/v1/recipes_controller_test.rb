require "test_helper"

class Api::V1::RecipesControllerTest < ActionDispatch::IntegrationTest
  include ::AuthorizationHelper

  test "should get recipes" do
    token = auth_tokens_for_user({ email: 'teste@teste.com.br', password: 1234 })
    get api_v1_recipes_url, headers: { 'token' => token }
    assert_response :success
  end
end

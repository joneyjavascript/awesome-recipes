
module AuthorizationHelper
  def auth_token_for_user(user)
    post '/api/v1/sessions',
      params: { email: user[:email], password: user[:password] },
      as: :json
    response.parsed_body['token']
  end
end
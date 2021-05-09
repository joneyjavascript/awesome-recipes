module JwtService
  class << self
    JWT_SECRET ||= Rails.application.config.jwt_secret
    ALGORITHM ||= 'HS256'.freeze

    def encode_token(id, name)
      expiracao = (60).minutes.from_now.to_i
      payload = {
        timestamp: DateTime.now.strftime('%Q'),
        id: id,
        name: name,
        exp: expiracao
      }

      JWT.encode(payload, JWT_SECRET, ALGORITHM)
    end

    def decode_token(token)
      JWT.decode(token, JWT_SECRET, true, algorithm: ALGORITHM)
    end
  end
end
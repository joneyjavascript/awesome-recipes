module Api
  module V1
    class ApiController < ActionController::API
      before_action :authorized

      include JwtService

      def authorized
        begin
          JwtService.decode_token request.headers["token"]
        rescue JWT::VerificationError
          render json: { message: 'token inválido' }, status: :unauthorized
        rescue JWT::DecodeError
          render json: { message: 'decode error, token inválido' }, status: :bad_request
        end
      end
    end
  end
end
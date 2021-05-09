module Api
  module V1
    class SessionsController < ApiController
      skip_before_action :authorized, only: [ :create ]

      def create
        user = User.find_by(email: params[:email])
  
        return render json: { message: 'E-mail não pode ficar em branco', type: 'danger' } if params[:email].blank?
        return render json: { message: 'Formato do e-mail inválido', type: 'danger' } unless Truemail.valid?(params[:email], with: :regex)
        return render json: { message: 'E-mail não cadastrado', type: 'danger' } unless user
        return render json: { message: 'Senha inválida', type: 'danger' } unless user && user.authenticate(params[:password])
  
        if user&.authenticate(params[:password])
          token = JwtService.encode_token(user.id, user.name)
          render json: { token: token, name: user.name }
        end
      end

    end
  end
end
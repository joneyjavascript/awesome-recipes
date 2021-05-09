class SessionsController < ApplicationController
    skip_before_action :authorized, only: [ :new, :create, :authorized ]

    def new

    end

    def create
      @user = User.find_by(email: params[:email])

      return redirect_to new_session_url, danger: "E-mail não pode ficar em branco" if params[:email].blank?
      return redirect_to new_session_url, danger: "Formato do e-mail inválido" unless Truemail.valid?(params[:email], with: :regex)
      return redirect_to new_session_url, danger: "E-mail não cadastrado" unless @user
      return redirect_to new_session_url, danger: "Senha inválida" unless @user && @user.authenticate(params[:password])

      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_url
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url
    end

end

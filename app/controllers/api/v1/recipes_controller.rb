module Api
  module V1
    class RecipesController < ApiController

      def index
        render json: Recipe.limit(5)
      end

      def show
        recipe = Recipe.find_by(id: params[:id])
        if recipe
          render json: recipe
        else
          render json: { message: 'Registro não encontrado' }, status: :not_found
        end
      end

      def create
        recipe = Recipe.new(params.require(:recipe).permit(:title, :description, :active))
        if recipe.save!
          render json: recipe
        end

      rescue
        render json: { message: recipe.errors.full_messages.join(', ') }, status: :bad_request
      end

      def destroy
        recipe = Recipe.find_by(id: params[:id])
        if recipe.destroy!
          render json: { message: 'Registro deletado' }
        else
          render json: { message: 'Não foi possível deletar o registro' }, status: :bad_request
        end
      end
    end
  end
end

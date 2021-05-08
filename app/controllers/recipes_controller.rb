class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def show
        parametros = params.permit(:id)
        @recipe = Recipe.find(parametros[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        recipe_data = params.require(:recipe).permit(:title, :description, :active)
        @recipe = Recipe.new(recipe_data)
        
        if @recipe.valid?
            @recipe.save!
            @mensagem = "Nova receita cadastrada com sucesso!"
        else
            @mensagem = "Não foi possível cadastrar a nova receita!"
        end
    end


end

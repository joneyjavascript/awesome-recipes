class HomeController < ApplicationController
    def index
        @last_recipes = Recipe.last_recipes(3)
        render
    end

    def login
        
    end
end

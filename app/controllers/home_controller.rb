class HomeController < ApplicationController
    skip_before_action :authorized, only: [ :index ]

    def index
        @last_recipes = Recipe.last_recipes(3)
        render
    end
end

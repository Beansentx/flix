class MoviesController < ApplicationController
    def index
        @movies = ["Iron Man", "Super Man", "Spider-Man"]
    end
end
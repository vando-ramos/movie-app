class HomeController < ApplicationController
  def index
    @genres = Genre.all
    @directors = Director.all
    @movies = Movie.all
  end
end

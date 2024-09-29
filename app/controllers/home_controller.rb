class HomeController < ApplicationController
  def index
    @movies = Movie.order(:title)
  end
end

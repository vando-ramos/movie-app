class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def show

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to root_path, notice: 'Filme cadastrado com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar filme!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :genre_id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end

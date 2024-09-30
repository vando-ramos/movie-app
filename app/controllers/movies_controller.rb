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
      redirect_to @movie, notice: 'Filme cadastrado com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar filme!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Filme atualizado com sucesso!'
    else
      flash.now.notice = 'Não foi possível atualizar filme!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_year, :synopsis, :country_of_origin, :duration, :director_id, :genre_id, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end

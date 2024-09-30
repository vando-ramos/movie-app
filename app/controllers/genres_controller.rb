class GenresController < ApplicationController
  before_action :set_genre, only: %i[show edit update destroy]

  def index
    @genres = Genre.order(:name)
  end

  def show

  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genres_path, notice: 'Gênero cadastrado com sucesso!'
    else
      flash.now.notice = 'Não possível cadastrar novo gênero!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @genre.update(genre_params)
      redirect_to @genre, notice: 'Gênero atualizado com sucesso!'
    else
      flash.now.notice = 'Não foi possível atualizar gênero!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end

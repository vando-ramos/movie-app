class DirectorsController < ApplicationController
  before_action :set_director, only: %i[show edit update destroy]

  def index
    @directors = Director.order(:name)
  end

  def show
    @movies = @director.movies.order(:release_year)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to directors_path, notice: 'Diretor cadastrado com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar diretor!'
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @director.update(director_params)
      redirect_to @director, notice: 'Diretor(a) atualizado com sucesso!'
    else
      flash.now.notice = 'Não foi possível atualizar diretor(a)!'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def director_params
    params.require(:director).permit(:name, :nationality, :date_of_birth, :genre_id)
  end

  def set_director
    @director = Director.find(params[:id])
  end
end

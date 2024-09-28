class DirectorsController < ApplicationController
  before_action :set_director, only: %i[show edit update destroy]

  def show

  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to root_path, notice: 'Diretor cadastrado com sucesso!'
    else
      flash.now.notice = 'Não foi possível cadastrar diretor!'
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

  def director_params
    params.require(:director).permit(:name, :nationality, :date_of_birth, :genre_id)
  end

  def set_director
    @director = Director.find(params[:id])
  end
end

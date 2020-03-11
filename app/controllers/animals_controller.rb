class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    render json: {status: 'SUCCESS', message: 'Loaded animals', data: @animals}, status: :ok
  end

  def show
    @animal = Animal.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded animal', data: @animal}, status: :ok
  end

  def new
  end

  def create
    @animal = Animal.create(animal_params)
    if @animal.valid?
      render json: {status: 'SUCCESS', message: 'Created animal record', data: @animal}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Trouble creating animal record', data: @animal.erros}, status: :unprocessable_entity
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    if @animal.valid?
      render json: {status: 'SUCCESS', message: 'Updated animal record', data: @animal}, status: :ok
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      render json: {status: 'SUCCESS', message: 'Deleted animal record', data: @animal}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Trouble deleting animal record', data: @animal.errors}, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom)
  end
end

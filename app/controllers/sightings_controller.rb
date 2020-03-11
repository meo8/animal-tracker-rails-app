class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
    render json: {status: 'SUCCESS', message: 'Loaded sightings', data: @sightings}, status: :ok
  end

  def show
    @sighting = Sighting.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded sighting', data: @sighting}, status: :ok
  end

  def edit
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
    @sighting.update(sighting_params)
    if @sighting.valid?
      render json: {status: 'SUCCESS', message: 'Updated sighting record', data: @sighting}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Trouble updating sighting record', data: @sighting.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    if @sighting.destroy
      render json: {status: 'SUCCESS', message: 'Deleted sighting record', data: @sighting}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Trouble deleting sighting record', data: @sighting.errors}, status: :ok
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitutde, :animal_id)
  end
end

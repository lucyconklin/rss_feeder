class AudiosController < ApplicationController

  def index
    @audio = Audio.new
    @audios = Audio.all
  end

  def create
    AudioService.new(audio_params)
    redirect_to root_path
  end

  private

  def audio_params
    params.require(:audio).permit(:url, :date)
  end
end

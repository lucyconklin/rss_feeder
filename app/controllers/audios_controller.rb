class AudiosController < ApplicationController

  def index
    @audio = Audio.new
    @audios = Audio.all
  end

  def create
    @audio = Audio.new(audio_params)
    byebug
    if @audio.save
      #do something
    else
      @errors = @audio.errors.full_messages
      #show an error
    end
  end

  private

  def audio_params
    params.require(:audio).permit(:url, :date)
  end
end

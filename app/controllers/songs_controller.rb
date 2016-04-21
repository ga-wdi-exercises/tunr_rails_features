class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @artist = Artist.find(params[:artist_id])
    @song.artist = @artist

    if @song.save
      redirect_to @artist, notice: "#{@song.title} sucessfully created."
    else
      # flash.now[:alert] = "FAILURE!"
      render "artists/show"
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to @song, notice: "#{@song.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path, notice: "#{@song.title} destroyed."
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end

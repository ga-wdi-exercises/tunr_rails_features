class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.new(song_params)
    @song.artist = @artist

    if @song.save
      redirect_to artist_song_path(@artist, @song), notice: "#{@song.title} sucessfully created."
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to artist_song_path(@song.artist, @song), notice: "#{@song.title} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to artist_songs_path(@song.artist), notice: "#{@song.title} destroyed."
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end

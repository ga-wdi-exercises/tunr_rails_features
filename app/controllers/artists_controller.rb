class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @song = Song.new # used for the form
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: "#{@artist.name} sucessfully created."
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to @artist, notice: "#{@artist.name} sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path, notice: "#{@artist.name} sucessfully destroyed"
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end

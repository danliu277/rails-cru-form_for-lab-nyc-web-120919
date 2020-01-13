class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
        @artists = Artist.all
        @genres = Genre.all
    end

    def create
        @song = Song.create(song_params)
        redirect_to song_path(@song.id)
    end

    def edit
        @song = Song.find(params[:id])
        @artists = Artist.all
        @genres = Genre.all
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song.id)
    end

    private
    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
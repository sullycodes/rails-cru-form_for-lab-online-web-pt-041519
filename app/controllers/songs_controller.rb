class SongsController < ApplicationController

    def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
		@artist = @song.artist
		@genre = @song.genre
	end

	def new
		@song = Song.new
	end

	def create
	  @song = Song.new
	  @song.name = params[:name]
	  @song.artist_id = params[:artist_id]
	  @song.genre_id = params[:genre_id]
	  @song.save
	  redirect_to song_path(@song)
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
	  @song = Song.find(params[:id])
	  @song.update(params.require(:song).permit(:name))
	  redirect_to song_path(@song)
	end

	private

	def song_params
		params.require(:song).permit(:name, :artist_id, :genre_id)
	end

end

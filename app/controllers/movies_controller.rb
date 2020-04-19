class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save!
    redirect_to(movies_url, :notice => 'Movie was successfully created.')
  end

  def show
    @movie = Movie.find(params[:id])
  end



  private

    def movie_params
      params.require(:movie).permit(:name, :released, :points, :liked)
    end
end

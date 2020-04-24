class MoviesController < ApplicationController
  before_action :set_movie, :only => [:edit, :update, :show, :destroy]
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

  def show; end

  def edit; end

  def update
    @movie.update!(movie_params)
    redirect_to(movie_path(@movie), :notice => 'Movie was successfully updated.')
  end

  def destroy
    @movie.destroy!
    redirect_to(movies_url, :notice => 'Movie was successfully destroyed.')
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:name, :released, :points, :liked)
    end
end

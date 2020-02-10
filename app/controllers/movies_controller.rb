class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    if params[:sort].nil? && params[:ratings].nil?
      @movies = Movie.all
    elsif params[:ratings].nil?
      @movies = Movie.select do |a,b|
        allowed[:sort] == 'G'
      end
      #@movies = Moive.all 
    else
      @movies = Moive.sort { |a,b| a <=> b}
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  def sort
    @movie = Movie.create!(movie_params)
    @movie.select('title')
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

end

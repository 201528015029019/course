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
	redirect_flag = false
    @sorting_by = params[:sorting_by]
	if @sorting_by == nil
		@sorting_by = session[:sorting_by]
		redirect_flag = true
	end
	session[:sorting_by] = @sorting_by
	
	@all_ratings = Movie.ratings
	@ratings = params[:ratings]
	if @ratings == nil
		@ratings = session[:ratings]
		redirect_flag = true
	elsif @ratings.kind_of?(Hash)
        @ratings = @ratings.keys
    end
	session[:ratings] = @ratings
	
	if redirect_flag == true
		flash.keep
		redirect_to movies_path(:sorting_by => @sorting_by, :ratings => @ratings)
	end
	
	if @ratings != nil
		@movies = Movie.order(@sorting_by).where(rating: @ratings)
    else
		@movies = Movie.order(@sorting_by).all
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

end

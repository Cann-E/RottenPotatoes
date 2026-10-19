class MoviesController < ApplicationController

  before_action :getmovie, only: [:show, :edit, :update, :destroy]


  def index

    sortcol = params[:sort]
    sortdir = params[:direction]

    if(sortcol == nil)
      sortcol = session[:sort_column]
      sortdir = session[:sort_direction]
    end

    if(!Movie::SORTABLE_COLUMNS.include?(sortcol))
      sortcol = nil
    end

    if(!Movie::SORT_DIRECTIONS.include?(sortdir))
      sortdir = "asc"
    end

    view = params[:view] || session[:view]

    if(view != "grid")
      view = "table"
    end

    session[:sort_column] = sortcol
    session[:sort_direction] = sortdir
    session[:view] = view

    @sort_column = sortcol
    @sort_direction = sortdir
    @view = view
    @movies = Movie.sortmovies(sortcol, sortdir)

  end


  def show
  end


  def new
    @movie = Movie.new
  end


  def edit
  end


  def create

    @movie = Movie.new(movieparams)

    if(@movie.save)
      redirect_to @movie, notice: "\"#{@movie.title}\" was added to the catalog."
    else
      render :new, status: :unprocessable_content
    end

  end


  def update

    if(@movie.update(movieparams))
      redirect_to @movie, notice: "Your changes to \"#{@movie.title}\" were saved.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end

  end


  def destroy

    @movie.destroy!
    redirect_to movies_path, notice: "\"#{@movie.title}\" was deleted.", status: :see_other

  end


  private

  def getmovie
    @movie = Movie.find(params[:id])
  end

  def movieparams
    return params.require(:movie).permit(:title, :rating, :description, :release_date, :poster_url)
  end

end

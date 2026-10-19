class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    # Explicit sort params win; otherwise fall back to the last sort the user picked,
    # so the ordering survives trips to new/show/edit and back.
    @sort_column = params[:sort] || session[:sort_column]
    @sort_direction = params[:direction] || session[:sort_direction]
    @sort_column = nil unless Movie::SORTABLE_COLUMNS.include?(@sort_column)
    @sort_direction = "asc" unless Movie::SORT_DIRECTIONS.include?(@sort_direction)

    session[:sort_column] = @sort_column
    session[:sort_direction] = @sort_direction

    @movies = Movie.sorted_by(@sort_column, @sort_direction)
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "\"#{@movie.title}\" was added to the catalog." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Your changes to \"#{@movie.title}\" were saved.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "\"#{@movie.title}\" was deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.expect(movie: [ :title, :rating, :description, :release_date ])
    end
end

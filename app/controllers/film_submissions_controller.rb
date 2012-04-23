class FilmSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  # GET /film_submissions
  # GET /film_submissions.json
  def index
    if current_user.is_artist?
      @film_submissions = current_user.artist.film_submissions
    elsif current_user.is_admin? || current_user.is_film_admin? 
      #@film_submissions = FilmSubmission.joins(:artist).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      @film_submissions = FilmSubmission.all
      #session[:query] = @film_submissions.map(&:id)
      #@count = FilmSubmission.search(params[:search]).count
    else
      
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @film_submissions }
    end
  end

  # GET /film_submissions/1
  # GET /film_submissions/1.json
  def show
    @film_submission = FilmSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film_submission }
    end
  end

  # GET /film_submissions/new
  # GET /film_submissions/new.json
  def new
    @film_submission = FilmSubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @film_submission }
    end
  end

  # GET /film_submissions/1/edit
  def edit
    @film_submission = FilmSubmission.find(params[:id])
  end

  # POST /film_submissions
  # POST /film_submissions.json
  def create
    @film_submission = FilmSubmission.new(params[:film_submission])
    @film_submission.artist_id = current_user.artist.id

    respond_to do |format|
      if @film_submission.save
        format.html { redirect_to film_submissions_path, notice: 'Video/Short Film submission was successfully created.' }
        format.json { render json: @film_submission, status: :created, location: @film_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @film_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /film_submissions/1
  # PUT /film_submissions/1.json
  def update
    @film_submission = FilmSubmission.find(params[:id])

    respond_to do |format|
      if @film_submission.update_attributes(params[:film_submission])
        format.html { redirect_to film_submissions_path, notice: 'Video/Short Film submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @film_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_submissions/1
  # DELETE /film_submissions/1.json
  def destroy
    @film_submission = FilmSubmission.find(params[:id])
    @film_submission.destroy

    respond_to do |format|
      format.html { redirect_to film_submissions_url }
      format.json { head :ok }
    end
  end
  
  private  
  def sort_column  
    FilmSubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
end

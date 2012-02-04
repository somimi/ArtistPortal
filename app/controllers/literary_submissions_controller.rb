class LiterarySubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  #load_and_authorize_resource
  
  # GET /literary_submissions
  # GET /literary_submissions.json
  def index
    if current_user.is_artist?
      @literary_submissions = current_user.artist.literary_submissions
    elsif current_user.is_admin? 
      @literary_submissions = LiterarySubmission.joins(:artist).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      session[:query] = @literary_submissions.map(&:id)
      @count = LiterarySubmission.search(params[:search]).count
    else
      
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @literary_submissions }
    end
  end

  # GET /literary_submissions/1
  # GET /literary_submissions/1.json
  def show
    @literary_submission = LiterarySubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @literary_submission }
    end
  end

  # GET /literary_submissions/new
  # GET /literary_submissions/new.json
  def new
    @literary_submission = LiterarySubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @literary_submission }
    end
  end

  # GET /literary_submissions/1/edit
  def edit
    @literary_submission = LiterarySubmission.find(params[:id])
  end

  # POST /literary_submissions
  # POST /literary_submissions.json
  def create
    @literary_submission = LiterarySubmission.new(params[:literary_submission])
     @literary_submission.artist_id = current_user.artist.id

    respond_to do |format|
      if @literary_submission.save
        format.html { redirect_to literary_submissions_path, notice: 'Literary submission was successfully created.' }
        format.json { render json: @literary_submission, status: :created, location: @literary_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @literary_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /literary_submissions/1
  # PUT /literary_submissions/1.json
  def update
    @literary_submission = LiterarySubmission.find(params[:id])

    respond_to do |format|
      if @literary_submission.update_attributes(params[:literary_submission])
        format.html { redirect_to literary_submissions_path, notice: 'Literary submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @literary_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /literary_submissions/1
  # DELETE /literary_submissions/1.json
  def destroy
    @literary_submission = LiterarySubmission.find(params[:id])
    @literary_submission.destroy

    respond_to do |format|
      format.html { redirect_to literary_submissions_url }
      format.json { head :ok }
    end
  end
  
  private  
  def sort_column  
    LiterarySubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
  

end

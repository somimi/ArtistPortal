class PerformanceSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  
  # GET /performance_submissions
  # GET /performance_submissions.json
  def index
    if current_user.is_artist?
      @performance_submissions = current_user.artist.performance_submissions
    elsif current_user.is_admin? || current_user.is_performance_admin?
      @performance_submissions = PerformanceSubmission.all
      #@performance_submissions = PerformanceSubmission.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      #session[:query] = @performance_submissions.map(&:id)
      #@count = PerformanceSubmission.search(params[:search]).count
    else
      
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @literary_submissions }
    end
  end
  # GET /performance_submissions/1
  # GET /performance_submissions/1.json
  def show
    @performance_submission = PerformanceSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performance_submission }
    end
  end

  # GET /performance_submissions/new
  # GET /performance_submissions/new.json
  def new
    @performance_submission = PerformanceSubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @performance_submission }
    end
  end

  # GET /performance_submissions/1/edit
  def edit
    @performance_submission = PerformanceSubmission.find(params[:id])
  end

  # POST /performance_submissions
  # POST /performance_submissions.json
  def create
    @performance_submission = PerformanceSubmission.new(params[:performance_submission])
    @performance_submission.artist_id = current_user.artist.id

    respond_to do |format|
      if @performance_submission.save
        format.html { redirect_to performance_submissions_path, notice: 'Performance submission was successfully created.' }
        format.json { render json: performance_submissions_path, status: :created, location: @performance_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @performance_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performance_submissions/1
  # PUT /performance_submissions/1.json
  def update
    @performance_submission = PerformanceSubmission.find(params[:id])

    respond_to do |format|
      if @performance_submission.update_attributes(params[:performance_submission])
        format.html { redirect_to performance_submissions_path, notice: 'Performance submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @performance_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_submissions/1
  # DELETE /performance_submissions/1.json
  def destroy
    @performance_submission = PerformanceSubmission.find(params[:id])
    @performance_submission.destroy

    respond_to do |format|
      format.html { redirect_to performance_submissions_url }
      format.json { head :ok }
    end
  end
  
  private  
  def sort_column  
    PerformanceSubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
  
end

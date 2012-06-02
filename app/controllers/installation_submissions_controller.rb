class InstallationSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  # GET /installation_submissions
  # GET /installation_submissions.json
  
  respond_to :html, :json
  
  def index
    if current_user.is_artist?
      @installation_submissions = current_user.artist.installation_submissions
    elsif current_user.is_admin? 
      #@installation_submissions = InstallationSubmission.joins(:artist).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      @installation_submissions = InstallationSubmission.all
    else
      
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @literary_submissions }
    end
  end

  # GET /installation_submissions/1
  # GET /installation_submissions/1.json
  def show
    @installation_submission = InstallationSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @installation_submission }
    end
  end

  # GET /installation_submissions/new
  # GET /installation_submissions/new.json
  def new
    @installation_submission = InstallationSubmission.new
    3.times { @installation_submission.installation_images.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @installation_submission }
    end
  end

  # GET /installation_submissions/1/edit
  def edit
    @installation_submission = InstallationSubmission.find(params[:id])
    3.times { @installation_submission.installation_images.build }
  end

  # POST /installation_submissions
  # POST /installation_submissions.json
  def create
    @installation_submission = InstallationSubmission.new(params[:installation_submission])
    @installation_submission.artist_id = current_user.artist.id

    respond_to do |format|
      if @installation_submission.save
        format.html { redirect_to installation_submissions_path, notice: 'Installation submission was successfully created.' }
        format.json { render json: @installation_submission, status: :created, location: @installation_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @installation_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /installation_submissions/1
  # PUT /installation_submissions/1.json
  def update
    @installation_submission = InstallationSubmission.find(params[:id])

    respond_to do |format|
      if @installation_submission.update_attributes(params[:installation_submission])
        format.html { redirect_to installation_submissions_path, notice: 'Installation submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @installation_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /installation_submissions/1
  # DELETE /installation_submissions/1.json
  def destroy
    @installation_submission = InstallationSubmission.find(params[:id])
    @installation_submission.destroy

    respond_to do |format|
      format.html { redirect_to installation_submissions_url }
      format.json { head :ok }
    end
  end
  
  private  
  def sort_column  
    InstallationSubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
  
  
end

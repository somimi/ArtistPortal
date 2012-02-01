class InstallationSubmissionsController < ApplicationController
  # GET /installation_submissions
  # GET /installation_submissions.json
  def index
    @installation_submissions = current_user.artist.installation_submissions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @installation_submissions }
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
end

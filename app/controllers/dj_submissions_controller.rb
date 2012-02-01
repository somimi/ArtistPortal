class DjSubmissionsController < ApplicationController
  # GET /dj_submissions
  # GET /dj_submissions.json
  def index
    @dj_submissions = current_user.artist.dj_submissions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dj_submissions }
    end
  end

  # GET /dj_submissions/1
  # GET /dj_submissions/1.json
  def show
    @dj_submission = DjSubmission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dj_submission }
    end
  end

  # GET /dj_submissions/new
  # GET /dj_submissions/new.json
  def new
    @dj_submission = DjSubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dj_submission }
    end
  end

  # GET /dj_submissions/1/edit
  def edit
    @dj_submission = DjSubmission.find(params[:id])
  end

  # POST /dj_submissions
  # POST /dj_submissions.json
  def create
    @dj_submission = DjSubmission.new(params[:dj_submission])

    respond_to do |format|
      if @dj_submission.save
        format.html { redirect_to @dj_submission, notice: 'Dj submission was successfully created.' }
        format.json { render json: @dj_submission, status: :created, location: @dj_submission }
      else
        format.html { render action: "new" }
        format.json { render json: @dj_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dj_submissions/1
  # PUT /dj_submissions/1.json
  def update
    @dj_submission = DjSubmission.find(params[:id])

    respond_to do |format|
      if @dj_submission.update_attributes(params[:dj_submission])
        format.html { redirect_to @dj_submission, notice: 'Dj submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dj_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dj_submissions/1
  # DELETE /dj_submissions/1.json
  def destroy
    @dj_submission = DjSubmission.find(params[:id])
    @dj_submission.destroy

    respond_to do |format|
      format.html { redirect_to dj_submissions_url }
      format.json { head :ok }
    end
  end
end

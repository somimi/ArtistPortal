class FilmSubmissionsController < ApplicationController
  # GET /film_submissions
  # GET /film_submissions.json
  def index
    @film_submissions = current_user.artist.film_submission

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

    respond_to do |format|
      if @film_submission.save
        format.html { redirect_to film_submissions_path, notice: 'Video Short/Film submission was successfully created.' }
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
end

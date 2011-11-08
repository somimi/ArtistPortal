class VisualSubmissionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.is_artist?
      @visual_submissions = current_user.artist.visual_submission  
    else 
      @visual_submissions = VisualSubmission.all
      session[:query] = @visual_submissions.map(&:id)
    end
  end

  def show
    @visual_submission = VisualSubmission.find(params[:id])
   if current_user.is_juror?  
     if session[:query]
       @next_submission = @visual_submission.next(session[:query])
       @prev_submission = @visual_submission.previous(session[:query])
     end 
   end
  end

  def new
    @visual_submission = VisualSubmission.new
  end

  def create
    @visual_submission = VisualSubmission.new(params[:visual_submission])
    @visual_submission.artist_id = current_user.artist.id
    if @visual_submission.save
      redirect_to @visual_submission, :notice => "Successfully created visual submission."
    else
      render :action => 'new'
    end
  end

  def edit
    @visual_submission = VisualSubmission.find(params[:id])
  end

  def update
    @visual_submission = VisualSubmission.find(params[:id])
    if @visual_submission.update_attributes(params[:visual_submission])
      redirect_to @visual_submission, :notice  => "Successfully updated visual submission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @visual_submission = VisualSubmission.find(params[:id])
    @visual_submission.destroy
    redirect_to visual_submissions_url, :notice => "Successfully destroyed visual submission."
  end
end

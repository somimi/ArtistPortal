class StoreSubmissionsController < ApplicationController
  def index
    @store_submissions = StoreSubmission.all
  end

  def show
    @store_submission = StoreSubmission.find(params[:id])
  end

  def new
    @store_submission = StoreSubmission.new
  end

  def create
    @store_submission = StoreSubmission.new(params[:store_submission])
    if @store_submission.save
      redirect_to @store_submission, :notice => "Successfully created store submission."
    else
      render :action => 'new'
    end
  end

  def edit
    @store_submission = StoreSubmission.find(params[:id])
  end

  def update
    @store_submission = StoreSubmission.find(params[:id])
    if @store_submission.update_attributes(params[:store_submission])
      redirect_to @store_submission, :notice  => "Successfully updated store submission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @store_submission = StoreSubmission.find(params[:id])
    @store_submission.destroy
    redirect_to store_submissions_url, :notice => "Successfully destroyed store submission."
  end
end

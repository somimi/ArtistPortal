class StoreSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  
  def index
    if current_user.is_artist?
      @store_submissions = current_user.artist.store_submissions
    elsif current_user.is_admin? 
      @store_submissions = StoreSubmission.joins(:artist).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      session[:query] = @store_submissions.map(&:id)
      @count = StoreSubmission.search(params[:search]).count
    else
      
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @literary_submissions }
    end
  end

  def show
    @store_submission = StoreSubmission.find(params[:id])
  end

  def new
    @store_submission = StoreSubmission.new
  end

  def create
    @store_submission = StoreSubmission.new(params[:store_submission])
    @store_submission.artist_id = current_user.artist.id
    if @store_submission.save
      redirect_to store_submissions_path, :notice => "Successfully created store submission."
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
      redirect_to store_submissions_path, :notice => "Successfully updated store submission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @store_submission = StoreSubmission.find(params[:id])
    @store_submission.destroy
    redirect_to store_submissions_url, :notice => "Successfully deleted store submission."
  end
  
  def duplicate
    @original_submission = StoreSubmission.find(params[:id])
    @store_submission = @original_submission.dup
    @store_submission.save
    redirect_to store_submissions_url, :notice => "Succesfully duplicated store submission."
  end
  
  def images
    store_submission = StoreSubmission.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_file store_submission.image.path(style), :type => store_submission.image_content_type, :disposition => 'inline'
  end
  
  private  
  def sort_column  
    StoreSubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
  
end
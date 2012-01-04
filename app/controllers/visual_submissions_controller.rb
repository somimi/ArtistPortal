class VisualSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    if current_user.is_artist?
      @visual_submissions = current_user.artist.visual_submission
      #@paypal = PayPal.new  
    elsif current_user.is_admin? || current_user.is_handler?
      @visual_submissions = VisualSubmission.joins(:artist).search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
      session[:query] = @visual_submissions.map(&:id)
    else
      if params[:filter] == "voted"
        @visual_submissions = VisualSubmission.voted(current_user.juror)
      else
        @visual
      end
      
    end
    
    
  end

  def show
    #@visual_submission = VisualSubmission.find(params[:id])
   if current_user.is_juror?  
     if session[:query]
       @next_submission = @visual_submission.next(session[:query])
       @prev_submission = @visual_submission.previous(session[:query])
     end 
   end
  end

  def new
    #@visual_submission = VisualSubmission.new
    3.times { @visual_submission.images.build }
  end
  

  def create
    #@visual_submission = VisualSubmission.new(params[:visual_submission])
    @visual_submission.artist_id = current_user.artist.id
    
      
    if @visual_submission.save
    #  if @visual_submission.store_submit?
    #    @store_submission = StoreSubmission.new
    #    @store_submission.artist_id = @visual_submission.artist_id
    #    @store_submission.title = @visual_submission.title
    #   @store_submission.save
    #  end
      
      redirect_to visual_submissions_path, :notice => "Successfully created visual submission."
    else
      render :action => 'new'
    end

    
    
  end

  def edit
    #@visual_submission = VisualSubmission.find(params[:id])
      count = (3 - @visual_submission.images.count)
      count.times { @visual_submission.images.build }
    
  end

  def update
    #@visual_submission = VisualSubmission.find(params[:id])
    if @visual_submission.update_attributes(params[:visual_submission])
      redirect_to visual_submissions_path, :notice  => "Successfully updated visual submission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @visual_submission = VisualSubmission.find(params[:id])
    @visual_submission.destroy
    redirect_to visual_submissions_url, :notice => "Successfully destroyed visual submission."
  end
  
  #def images
  #  
  #  visual_submission = VisualSubmission.find(params[:id])
  #  style = params[:style] ? params[:style] : 'original'
  #  send_file visual_submission.image.path(style), :type => visual_submission.image_content_type, :disposition => 'inline'
  #  
  #end  
  
  private  
  def sort_column  
    VisualSubmission.column_names.include?(params[:sort]) ? params[:sort] : "title"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
end

class VisualSubmissionsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html, :json
  
  def index
    if current_user.is_artist? || current_user.is_invited?
      @visual_submissions = current_user.artist.visual_submissions
    elsif current_user.is_admin? || current_user.is_handler?
      #@visual_submissions = VisualSubmission.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
      @visual_submissions = VisualSubmission.all
      
      session[:query] = @visual_submissions.map(&:id)
      VisualSubmission.search(params[:search]).count
    elsif current_user.is_art_guide?
      @visual_submissions = VisualSubmission.where("acceptance_status != ?" , "Denied")
    elsif current_user.is_juror?
      if params[:filter] == "voted"
        @visual_submissions = VisualSubmission.voted(current_user.juror).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
        session[:query] = @visual_submissions.map(&:id)
        @count = @visual_submissions.count
      elsif params[:filter] == "not_voted"
        @visual_submissions = VisualSubmission.not_voted(current_user.juror).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
        session[:query] = @visual_submissions.map(&:id)
        @count = @visual_submissions.count
      else
        @visual_submissions = VisualSubmission.juror_all.order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
        session[:query] = @visual_submissions.map(&:id)
        @count = @visual_submissions.count
      end
      @juror_count = VisualSubmission.unvoted_count(current_user.juror)
    else
      @visual_submissions = VisualSubmission.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
    end
     @count = VisualSubmission.search(params[:search])
     
  end

  def show
    #@visual_submission = VisualSubmission.find(params[:id])
     if session[:query]
       @next_submission = @visual_submission.next(session[:query])
       @prev_submission = @visual_submission.previous(session[:query])
     end 
  end

  def new
    #@visual_submission = VisualSubmission.new
     count = (3 - @visual_submission.images.count)
      count.times { @visual_submission.images.build }
  end
  

  def create
    #@visual_submission = VisualSubmission.new(params[:visual_submission])
    @visual_submission.artist_id = current_user.artist.id
    
    if @visual_submission.save
      if @visual_submission.store_submit?
        logger.debug "store_submit was true"
        @store_submission = StoreSubmission.new
        @store_submission.artist_id = @visual_submission.artist_id
        @store_submission.title = @visual_submission.title
        @store_submission.visual_submission_id = @visual_submission.id
        @store_submission.save
      end
      redirect_to visual_submissions_path, :notice => "Successfully created visual submission."
    else
      render :action => 'new'
    end
  end

  def edit
      #@visual_submission = VisualSubmission.find(params[:id])
      #3.times { @visual_submission.images.build }
      count = (3 - @visual_submission.images.count)
      count.times { @visual_submission.images.build }
      
      @count = count
      
      if current_user.is_handler?
        render "handler_edit"
      end
    
  end

  def update
    #@visual_submission = VisualSubmission.find(params[:id])
    if current_user.is_artist?
      @visual_submission.update_attributes(params[:visual_submission])
    elsif current_user.is_juror?
      @visual_submission.attributes = (params[:visual_submission])
      @visual_submission.average_vote = @visual_submission.average_votes
      @visual_submission.save
    else
      @visual_submission.attributes = (params[:visual_submission])
      @visual_submission.save(:validate => :false)
      if @visual_submission.acceptance_status == "Accepted"
        @visual_submission.artist.update_attribute(:acceptance_status, @visual_submission.artist.acceptance_status + 1)
      elsif @visual_submission.acceptance_status == "Declined"
        if @visual_submission.artist.acceptance_status > 0
          @visual_submission.artist.update_attribute(:acceptance_status, @visual_submission.artist.acceptance_status - 1)
        end
      end
    end 
    
    @store_submission = StoreSubmission.where("visual_submission_id", @visual_submission.id)
     if @visual_submission.store_submit?
       if !@store_submission.nil?
         logger.debug "we aleady have a submission"
       else  
         @store_submission = StoreSubmission.new
         @store_submission.artist_id = @visual_submission.artist_id
         @store_submission.title = @visual_submission.title
         @store_submission.visual_submission_id = @visual_submission.id
         @store_submission.save
       end
      end
      respond_with @visual_submission
      #if current_user.is_admin?
      #  redirect_to visual_submissions_path
      #else
      #  respond_with @visual_submission
      #end
  end

  def destroy
    @visual_submission = VisualSubmission.find(params[:id])
    @visual_submission.destroy
    redirect_to visual_submissions_url, :notice => "Successfully deleted visual submission."
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
    VisualSubmission.column_names.include?(params[:sort]) ? params[:sort] : "ID"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"    
  end
end

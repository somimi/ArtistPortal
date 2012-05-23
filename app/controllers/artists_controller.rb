class ArtistsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  before_filter :load_paypal
  
  load_and_authorize_resource
  
  respond_to :html, :json
  
  
  def index
    #@artists = Artist.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(30)
    @artists = Artist.all
  end


  def show
    @artist = Artist.find(params[:id])
    @visual_submissions = @artist.visual_submissions
    @store_submissions = @artist.store_submissions
    
    if current_user.is_handler?
      render "handler_show"
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    @artist.user_id = current_user.id
    if current_user.is_invited?
      @artist.acceptance_status = 10;
    end
    
    if @artist.save
      redirect_to root_path, :notice => "Successfully created artist profile."
    else
      render :action => 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  
  #def update
    #@artist = Artist.find(params[:id])
    #@artist.update_attributes(params[:artist])
  #  @artist.attributes = (params[:artist])
  ##  @artist.save(:validate => :false)
  #  respond_with @artist
#  end

  def update
    @artist = Artist.find(params[:id])
    if current_user.is_artist?
      if @artist.update_attributes(params[:artist])
          redirect_to root_path, :notice  => "Successfully updated artist profile."
      else
        render :action => 'edit'
      end
    else
        @artist.attributes = (params[:artist])
        if  @artist.save(:validate => false)
          respond_with @artist
      else
        render :action => 'edit'
      end
    end
  end
  
  def edit_notes
    @artist = Artist.find(params[:id])  
    render :edit_notes, :layout => false
    
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_url, :notice => "Successfully deleted artist."
  end
  
  def load_paypal
    @paypal = Paypal.new
  end
  
  private  
  def sort_column  
    Artist.column_names.include?(params[:sort]) ? params[:sort] : "first_name"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
  end
  

end

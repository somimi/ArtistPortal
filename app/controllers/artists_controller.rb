class ArtistsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!
  before_filter :load_paypal
  load_and_authorize_resource
  def index
    @artists = Artist.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(5)
  end


  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    @artist.user_id = current_user.id
    if @artist.save
      redirect_to root_path, :notice => "Successfully created artist profile."
    else
      render :action => 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      if @current_user.role == "artist"
        redirect_to root_path, :notice  => "Successfully updated artist profile."
      else
        redirect_to artists_path
      end 
    else
      render :action => 'edit'
    end
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

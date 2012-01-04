class ImagesController < ApplicationController
  def images
    
    image = Image.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_file image.image.path(style), :type => image.image_content_type, :disposition => 'inline'
    
  end


end


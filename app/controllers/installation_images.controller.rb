class InstallationImagesController < ApplicationController
  def installation_images
    installation_image = InstallationImage.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_file installation_image.installation_image.path(style), :type => installation_image.installation_image_content_type, :disposition => 'inline'
    
  end


end
class InstallationImage < ActiveRecord::Base
  belongs_to :installation_submission
  has_attached_file :installation_image, :styles => { :large => "600x600>", :small => "150x150>", :thumb => "50x50>"}, :convert_options => {:all => "-auto-orient"},
	                  :path => ':rails_root/install-image-secure/system/:attachment/:id/:style/:basename.:extension',
                    :url => '/installation_images/:id/:attachment?style=:style'

end

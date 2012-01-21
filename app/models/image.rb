class Image < ActiveRecord::Base
  belongs_to :visual_submission

   validates_attachment_size :image, :less_than => 6.megabytes
 
  has_attached_file :image, :styles => { :original => "100%", :large => "600x600>", :small => "150x150>", :thumb => "50x50>"}, :convert_options => {:all => "-auto-orient"},
	                  :path => ':rails_root/secure/system/:attachment/:id/:style/:basename.:extension',
                    :url => '/images/:id/:attachment?style=:style'
  
  
end

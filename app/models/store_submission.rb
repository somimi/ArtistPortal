class StoreSubmission < ActiveRecord::Base
  
  belongs_to :artist
  
  validates_presence_of  :title, :description, :quantity
  has_attached_file :image, :styles => {:large => "600x600>", :small => "150x150>", :thumb => "50x50>"},
                    :path => ':rails_root/store-secure/system/:attachment/:id/:style/:basename.:extension',
                    :url => '/:class/:id/:attachment?style=:style'
  
  attr_accessible :artist_id, :title, :description, :quantity, :quantity_accepted, :accepted, :image
  
  
end

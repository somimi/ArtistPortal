class StoreSubmission < ActiveRecord::Base
  
  belongs_to :artist
  belongs_to :visual_submission
  
  validates_presence_of :title
  
  set_inheritance_column 'not_type'
  
  has_attached_file :image, :styles => {:large => "600x600>", :small => "150x150>", :thumb => "50x50>"},
                    :path => ':rails_root/store-secure/system/:attachment/:id/:style/:basename.:extension',
                    :url => '/:class/:id/:attachment?style=:style'
  
  attr_accessible :artist_id, :title, :description, :quantity, :quantity_accepted, :accepted, :image, :type, :type_other, :price, :height, :width, :depth, :h_unit, :w_unit, :d_unit, :presentation, :presentation_other, :provide_display, :notes, :dimension, :visual_submission_id
  
  def self.search(search)  
       
    if search
      joins(:artist).where('title LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else  
      scoped  
    end  
    
  end
  
  
end

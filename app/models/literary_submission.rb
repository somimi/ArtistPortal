class LiterarySubmission < ActiveRecord::Base
  belongs_to :artist
  
  validates_presence_of :title, :lit_type, :doc
  
  has_attached_file :doc
  
  
  def self.search(search)  
       
    if search
      joins(:artist).where('title LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else  
      scoped  
    end  
    
  end
end

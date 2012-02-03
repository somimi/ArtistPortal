class LiterarySubmission < ActiveRecord::Base
  belongs_to :artist
  
  validates_presence_of :title, :lit_type, :doc
  
  has_attached_file :doc
end

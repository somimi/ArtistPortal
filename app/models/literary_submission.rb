class LiterarySubmission < ActiveRecord::Base
  belongs_to :artist
  
  validates_presence_of :title, :type, :doc
  
  has_attached_file :doc
end

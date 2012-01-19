class LiterarySubmission < ActiveRecord::Base
  belongs_to :artist
  
  has_attached_file :doc
end

class FilmSubmission < ActiveRecord::Base
  
  belongs_to :artist
  
  validates_presence_of :title, :duration
end

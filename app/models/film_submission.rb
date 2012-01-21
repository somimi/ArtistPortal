class FilmSubmission < ActiveRecord::Base
  
  belongs_to :artist
  
  validates_presence_of :title, :duration
  #validates :duration, :film_duration => true
end

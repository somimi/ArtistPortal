class FilmSubmission < ActiveRecord::Base
  validates_presence_of :title, :description, :duration
  #validates :duration, :film_duration => true
end

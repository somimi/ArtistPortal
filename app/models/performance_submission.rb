class PerformanceSubmission < ActiveRecord::Base
  
  belongs_to :artist
  
  validates_presence_of :title, :description
  
end

class StoreSubmission < ActiveRecord::Base
  
  belongs_to :artist
  
  attr_accessible :artist_id, :title, :description, :quantity, :quantity_accepted, :accepted
  
  
end

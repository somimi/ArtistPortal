class VisualSubmission < ActiveRecord::Base

	belongs_to :artist
	has_many   :images
	has_many   :store_submissions
	
	after_save :average_votes
	accepts_nested_attributes_for :images, :allow_destroy => true;
                    
  attr_accessible :title, :medium, :dimension, :height, :width, :depth, :h_unit, :w_unit, :d_unit, :year_created, :sale_price, :notes, :received_date, :pickedup_date, :pickedup_by, :shipped_date, :shipped_carrier, :shipped_tracking, :limited_edition, :edition_position, :edition_total, :jury_one_vote, :jury_two_vote, :jury_three_vote, :jury_four_vote, :jury_five_vote, :images, :images_attributes, :store_submit, :edition, :acceptance_status, :donate_proceeds, :art_received
  validates_presence_of :title, :medium, :height, :width, :h_unit, :w_unit, :year_created, :sale_price, :images
  validates_numericality_of :sale_price, :only_integer => true, :message => "can only be whole number."
  validates :sale_price, :visual_price => true

  
  
  def previous(query)
    index = query.find_index(self.id)
    prev_id = query[index - 1] unless index.zero?
    self.class.find_by_id(prev_id)
  end 

  def next(query)
    unless query.nil?
      index = query.find_index(self.id)
      next_id = query[index + 1] unless index == query.size
      self.class.find_by_id(next_id)
    end
  end
  
  def self.search(search)  
    if search
      where('id= ? OR title LIKE ? OR medium LIKE ? OR acceptance_status LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order("RAND()")
    else  
      scoped  
    end     
  end
  
  def self.juror_all
    where("acceptance_status != ? OR acceptance_status != ?", "Denied", "Invited")
  end
  
  def self.accepted
    where("acceptance_status = 'Accepted' OR acceptance_status = 'Invited'")
  end
  
  
  def self.not_voted(juror)
     #where("jury_#{juror}_vote" => false, "acceptance_status" => "declined")
     where("jury_#{juror}_vote IS NULL")
   end
   
  def self.voted(juror)
    where("jury_#{juror}_vote IS NOT NULL")
  end
  
  def average_votes

    sum = 0
    count = 0
    sum += jury_one_vote unless jury_one_vote.nil?
    sum += jury_two_vote unless jury_two_vote.nil?
    sum += jury_three_vote unless jury_three_vote.nil?
    sum += jury_four_vote unless jury_four_vote.nil?
    sum += jury_five_vote unless jury_five_vote.nil?

    count += 1 unless jury_one_vote.nil?
    count += 1 unless jury_two_vote.nil?
    count += 1 unless jury_three_vote.nil?
    count += 1 unless jury_four_vote.nil?
    count += 1 unless jury_five_vote.nil?
    
    return (sum.to_f/count.to_f).round(1) if count > 0 
  end
  
  def self.unvoted_count(juror)
    where("jury_#{juror}_vote IS NULL").count
  end
    
  
end


                   


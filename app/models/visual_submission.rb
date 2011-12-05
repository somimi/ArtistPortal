class VisualSubmission < ActiveRecord::Base

	belongs_to :artist
	after_save :average_votes
	has_attached_file :image, :styles => { :original => "100%", :large => "600x600>", :small => "150x150>", :thumb => "50x50>"}, :convert_options => {:all => "-auto-orient"},
	                  :path => ':rails_root/secure/system/:attachment/:id/:style/:basename.:extension',
                    :url => '/:class/:id/:attachment?style=:style'
                    
  attr_accessible :title, :medium, :dimension, :height, :width, :depth, :h_unit, :w_unit, :d_unit, :year_created, :sale_price, :notes, :received_date, :pickedup_date, :pickedup_by, :shipped_date, :shipped_carrier, :shipped_tracking, :limited_edition, :edition_position, :edition_total, :jury_one_vote, :jury_two_vote, :jury_three_vote, :jury_four_vote, :jury_five_vote, :image
  validates_presence_of :title, :medium, :height, :width, :h_unit, :w_unit, :year_created, :sale_price, :image
  #validates_presence_of :depth, :d_unit, :dimension => true
  
  
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
      joins(:artist).where('title LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else  
      scoped  
    end  
    
  end
  
  def self.not_voted(juror)
     #where("jury_#{juror}_vote" => false, "acceptance_status" => "declined")
     where("jury_#{juror}_vote is null")
   end
   
  def self.voted(juror)
    where("jury_#{juror}_vote is not null and acceptance_status != 'declined'")
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
    
  
end


                   


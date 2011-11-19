class VisualSubmission < ActiveRecord::Base


	belongs_to :artist
	has_attached_file :image, :styles => { :large => "800x800>", :small => "150x150>", :thumb => "50x50>"}
  attr_accessible :title, :medium, :dimension, :height, :width, :depth, :h_unit, :w_unit, :d_unit, :year_created, :sale_price, :notes, :received_date, :pickedup_date, :pickedup_by, :shipped_date, :shipped_carrier, :shipped_tracking, :limited_edition, :edition_position, :edition_total, :jury_one_vote, :jury_two_vote, :jury_three_vote, :jury_four_vote, :image
  
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
  
end

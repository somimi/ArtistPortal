class PerformanceSubmission < ActiveRecord::Base

  belongs_to :artist

  validates_presence_of :title, :description

  def self.search(search)
    if search
      joins(:artist).where('title LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

end

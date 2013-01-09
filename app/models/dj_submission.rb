class DjSubmission < ActiveRecord::Base
  belongs_to :artist

  def self.search(search)
    if search
      joins(:artist).where('first_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end

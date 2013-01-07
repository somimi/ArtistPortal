class InstallationSubmission < ActiveRecord::Base
  has_many :installation_images
  belongs_to :artist
  validates_presence_of :title
  accepts_nested_attributes_for :installation_images, :allow_destroy => true

  def self.search(search)
    if search
      joins(:artist).where('title LIKE ? OR first_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
end

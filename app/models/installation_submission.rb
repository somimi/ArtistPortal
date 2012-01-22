class InstallationSubmission < ActiveRecord::Base
  has_many :installation_images
  belongs_to :artist
  validates_presence_of :title
  accepts_nested_attributes_for :installation_images, :allow_destroy => true
end

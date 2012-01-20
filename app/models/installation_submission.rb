class InstallationSubmission < ActiveRecord::Base
  has_many :installation_images
  belongs_to :artist
  accepts_nested_attributes_for :installation_images, :allow_destroy => true
end

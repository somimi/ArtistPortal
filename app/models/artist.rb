class Artist < ActiveRecord::Base

  has_many :visual_submission
  belongs_to :user
  
  validates_presence_of :first_name, :last_name, :email, :phone, :mailing_address_line1, :mailing_city, :mailing_state, :mailing_country, :bio
  
  attr_accessible :first_name, :last_name, :user_id, :professional_name, :email, :phone, :mailing_address_line1, :mailing_address_line2, :mailing_city, :mailing_zip, :shipping_address_line1, :shipping_address_line2, :shipping_city, :shipping_zip, :shipping_state, :mailing_state, :shipping_country, :mailing_country, :shipping_same_as_mail, :shipping_account, :bio, :require_representation, :paid_literary, :paid_visual

  def self.search(search)  
    if search  
      where('first_name LIKE ?', "%#{search}%")
    else  
      scoped  
    end  
  end

end

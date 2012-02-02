class Artist < ActiveRecord::Base

  has_many :visual_submissions
  has_many :store_submissions
  has_many :literary_submissions
  has_many :installation_submissions
  has_many :film_submissions
  has_many :performance_submissions
  belongs_to :user
  
  validates_presence_of :first_name, :last_name, :email, :phone, :mailing_address_line1, :mailing_city, :mailing_state, :mailing_country, :bio, :email_confirmation, :mailing_zip
  validates_confirmation_of :email
  attr_accessible :first_name, :last_name, :user_id, :professional_name, :email, :phone, :mailing_address_line1, :mailing_address_line2, :mailing_city, :mailing_zip, :shipping_address_line1, :shipping_address_line2, :shipping_city, :shipping_zip, :shipping_state, :mailing_state, :shipping_country, :mailing_country, :shipping_same_as_mail, :shipping_account, :bio, :require_representation, :literary_paid, :visual_paid, :film_paid, :installation_paid, :shipping_company, :email_confirmation, :delivery_arrangements, :return_arrangements, :representname
  attr_accessor :email_confirmation

  def north_america?
    mailing_country == "Mexico" or mailing_country == "Canada" or mailing_country == "United States"
  end

  def self.search(search)  
    if search  
      where('first_name LIKE ?', "%#{search}%")
    else  
      scoped  
    end  
  end

end

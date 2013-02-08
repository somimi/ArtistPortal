class Artist < ActiveRecord::Base

  has_many :visual_submissions
  has_many :store_submissions
  has_many :literary_submissions
  has_many :installation_submissions
  has_many :film_submissions
  has_many :performance_submissions
  has_many :dj_submissions
  has_many :orders
  belongs_to :user

  validates_presence_of :first_name, :last_name, :email, :phone, :mailing_address_line1, :mailing_city, :mailing_state, :mailing_country, :bio, :mailing_zip
  validates_presence_of :email_confirmation, :if => :email_changed?

  validates_confirmation_of :email

  attr_accessible :first_name, :last_name, :user_id, :professional_name, :email, :phone, :mailing_address_line1, :mailing_address_line2, :mailing_city, :mailing_zip, :shipping_address_line1, :shipping_address_line2, :shipping_city, :shipping_zip, :shipping_state, :mailing_state, :shipping_country, :mailing_country, :shipping_same_as_mail, :shipping_account, :bio, :require_representation, :literary_paid, :visual_paid, :film_paid, :installation_paid, :shipping_company, :store_paid, :email_confirmation, :delivery_arrangements, :return_arrangements, :representname, :represent_gallery, :acceptance_status, :admin_notes, :shipping_label, :paperwork_complete, :paperwork_notes, :store_shipped_with_with_visual, :pickedup_by, :tracking_number
  attr_accessor :email_confirmation

  def north_america?
    mailing_country == "Mexico" or mailing_country == "Canada" or mailing_country == "United States"
  end

  def self.search(search)
    if search
      where('first_name LIKE ? OR last_name LIKE ? or email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  def unpaid_fees
    unpaid_fees = []
    Fee.all.each do |fee|
      case fee.name
      when /VISUAL/i
        unpaid_fees << fee unless self.visual_paid
      when /LITERARY/i
        unpaid_fees << fee unless self.literary_paid
      when /INSTALLATION/i
        unpaid_fees << fee unless self.installation_paid
      when /FILM/i
        unpaid_fees << fee unless self.film_paid
      when /STORE/i
        unpaid_fees << fee unless self.store_paid
      else
        unpaid_fees << fee
      end
    end
    unpaid_fees
  end
end

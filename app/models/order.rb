class Order < ActiveRecord::Base
  belongs_to :artist
  has_many :order_items, :autosave => true

  validates_presence_of :artist, :status

  after_save :update_paid_fields_user

  PAID = "paid"
  UNPAID = "unpaid"

  def total
    order_items.sum { |item| item.fee.amount }
  end

  def fees
    order_items.map { |item| item.fee }
  end

  def paid?
    self.status == PAID
  end

  def update_paid_fields_user
    self.reload
    return unless self.paid?

    self.fees.each do |fee|
      case fee.name
      when /VISUAL/i
        self.artist.visual_paid = true
      when /LITERARY/i
        self.artist.literary_paid = true
      when /INSTALLATION/i
        self.artist.installation_paid = true
      when /FILM/i
        self.artist.film_paid = true
      when /STORE/i
        self.artist.store_paid = true
      end
    end

    self.artist.save!
  end
end

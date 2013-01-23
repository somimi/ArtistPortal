class Order < ActiveRecord::Base
  belongs_to :artist
  has_many :order_items, :autosave => true

  validates_presence_of :artist, :status

  PAID = "paid"
  UNPAID = "unpaid"

  def total
    order_items.sum { |item| item.fee.amount }
  end

  def fees
    order_items.map { |item| item.fee }
  end
end

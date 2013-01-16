class Order < ActiveRecord::Base
  belongs_to :artist
  has_many :order_items

  validates_presence_of :artist, :status

  PAID = "paid"
  UNPAID = "unpaid"

  def total
    order_items.sum { |item| item.fee.amount }
  end
end

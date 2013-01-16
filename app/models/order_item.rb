class OrderItem < ActiveRecord::Base
  belongs_to :fee
  belongs_to :order

  validates_presence_of :fee_id, :order_id

  attr_accessible :fee_id, :order_id, :fee, :order
end

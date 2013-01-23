class OrderItem < ActiveRecord::Base
  belongs_to :fee
  belongs_to :order

  validates_presence_of :fee, :order

  attr_accessible :fee_id, :order_id, :fee, :order
end

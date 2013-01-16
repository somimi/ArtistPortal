require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def test_creation
    order_item = OrderItem.new
    order_item.fee = fees(:visual)
    order_item.order = orders(:paid)

    assert order_item.valid?
    assert order_item.save!
  end
end

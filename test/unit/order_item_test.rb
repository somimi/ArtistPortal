require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def test_creation
    order = orders(:paid)
    order_item = OrderItem.new(:fee => fees(:visual))
    order.order_items << order_item

    order.save!

    order.reload
    assert_equal 1, order.order_items.count

    order_item.reload

    assert_equal fees(:visual), order_item.fee
    assert_equal orders(:paid), order_item.order
  end
end

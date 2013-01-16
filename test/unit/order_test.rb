require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def test_add_order_items
    order = Order.create!(:artist => artists(:one),
                          :status => Order::UNPAID)

    visual_fee   = OrderItem.create!( :fee   => fees(:visual),
                                      :order => order)
    literary_fee = OrderItem.create!( :fee   => fees(:literary),
                                      :order => order)

    order.reload

    assert_equal 2, order.order_items.length
  end

  def test_total
    order = Order.create!(:artist => artists(:one),
                          :status => Order::UNPAID)

    visual_fee   = OrderItem.create!( :fee   => fees(:visual),
                                      :order => order)
    literary_fee = OrderItem.create!( :fee   => fees(:literary),
                                      :order => order)

    order.reload

    expected_total = fees(:visual).amount + fees(:literary).amount

    assert_equal expected_total, order.total
  end
end

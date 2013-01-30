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

  def test_fees
    order = Order.create!(:artist => artists(:one),
                          :status => Order::UNPAID)

    visual_fee   = OrderItem.create!( :fee   => fees(:visual),
                                      :order => order)
    literary_fee = OrderItem.create!( :fee   => fees(:literary),
                                      :order => order)

    order.reload

    assert_equal 2, order.fees.count
    assert_equal [fees(:visual), fees(:literary)].sort, order.fees.sort
  end

  def test_paid_true
    order = Order.create!(:artist => artists(:one),
                          :status => Order::PAID)
    assert order.paid?
  end

  def test_paid_false
    order = Order.create!(:artist => artists(:one),
                          :status => Order::UNPAID)
    refute order.paid?
  end

  def test_update_paid_fields_user
    artist = artists(:one)

    order = Order.create!(:artist => artist,
                          :status => Order::PAID)

    fees_to_test = [[fees(:visual), 'visual_paid'],
                    [fees(:literary), 'literary_paid'],
                    [fees(:installation), 'installation_paid'],
                    [fees(:film), 'film_paid'],
                    [fees(:store), 'store_paid']]

    fees_to_test.each do |fee, user_field|
      OrderItem.create!( :fee => fee,
                         :order => order)

      artist.reload
      assert artist.send(user_field), "failure setting #{user_field}"
    end

    assert_equal 5, order.fees.count
  end
end

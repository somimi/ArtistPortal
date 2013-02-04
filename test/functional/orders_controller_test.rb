require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  def paid_charge
    Struct.new("Charge", :paid)
    Struct::Charge.new(true)
  end

  def test_create
    sign_in :user, users(:one)

    Stripe::Charge.stubs(:create).returns(paid_charge)
    assert_difference 'Order.count', 1 do
      post :create, { "fee_ids" => [fees(:visual), fees(:literary)]}
    end

    assert_redirected_to pages_home_path
    new_order = Order.last

    assert_equal 2, new_order.order_items.count
    assert_equal [fees(:visual), fees(:literary)].sort, new_order.fees.sort
    assert_equal users(:one).artist, new_order.artist

    assert_equal 25, new_order.total
  end

  # Todo failure cases

  def test_new
    sign_in :user, users(:one)

    get :new
    assert_response :success

    assert_equal Fee.all.sort, assigns(:fees).sort

    # Page should contain all the fee names
    Fee.all.each do |fee|
      assert_match /#{fee.amount}/, response.body, "Missing amount for #{fee.name}"
      assert_match fee.description, response.body, "Missing description for #{fee.name}"
    end
  end

  # setup do
  #   @order = orders(:one)
  # end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:orders)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create order" do
  #   assert_difference('Order.count') do
  #     post :create, order: {  }
  #   end

  #   assert_redirected_to order_path(assigns(:order))
  # end

  # test "should show order" do
  #   get :show, id: @order
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @order
  #   assert_response :success
  # end

  # test "should update order" do
  #   put :update, id: @order, order: {  }
  #   assert_redirected_to order_path(assigns(:order))
  # end

  # test "should destroy order" do
  #   assert_difference('Order.count', -1) do
  #     delete :destroy, id: @order
  #   end

  #   assert_redirected_to orders_path
  # end
end

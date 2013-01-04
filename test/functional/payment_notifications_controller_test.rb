require 'test_helper'

class PaymentNotificationsControllerTest < ActionController::TestCase
  def test_create_valid
    PaymentNotification.any_instance.stubs(:valid?).returns(true)
    post :create, post_params
    assert_equal " ", response.body
  end

  def post_params
    { :invoice => "12345",
      :status  => "Completed",
      :txn_id  => "99999",
      :product => "1" }
  end
end

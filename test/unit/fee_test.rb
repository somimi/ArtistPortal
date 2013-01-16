require 'test_helper'

class FeeTest < ActiveSupport::TestCase
  def test_creation
    fee = Fee.new(:name => "Test Fee",
                  :amount => 32,
                  :active => true)
    assert fee.valid?
  end

  def test_fee_defaults_to_active
    fee = Fee.create!(:name => "Test Fee",
                      :amount => 10)
    assert fee.active?
  end

  def test_names_must_be_unique
    fee1 = Fee.create!(:name => "Test Fee",
                       :amount => 10)
    assert_raise(ActiveRecord::RecordInvalid) do
      fee2 = Fee.create!(:name => "Test Fee",
                         :amount => 10)
    end
  end
end

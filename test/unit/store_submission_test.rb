require 'test_helper'

class StoreSubmissionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StoreSubmission.new.valid?
  end
end

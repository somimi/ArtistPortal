require 'test_helper'

class VisualSubmissionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert VisualSubmission.new.valid?
  end
end

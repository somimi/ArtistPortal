require 'test_helper'

class DjSubmissionTest < ActiveSupport::TestCase
  def test_validations
    dj_submission = DjSubmission.new()

    assert dj_submission.valid?
  end

  def test_can_have_an_artist
    dj_submission = DjSubmission.new(:artist => artists(:one))

    assert_equal dj_submission.artist, artists(:one)
  end

  def test_search_by_title
    artist = artists(:one)

    submission = DjSubmission.create!(:artist => artist)
    
    # Full text match
    assert_equal [submission], DjSubmission.search(artist.first_name)

    # Partial text match
    assert_equal [submission], DjSubmission.search(artist.first_name[1..3])
  end
end

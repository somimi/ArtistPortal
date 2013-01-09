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
    artist = Artist.create!(:first_name => "NewArtist",
                            :last_name => "LastName",
                            :email => "test@example.com",
                            :email_confirmation => "test@example.com",
                            :mailing_address_line1 => "123 Fake Street",
                            :mailing_city => "Seattle",
                            :mailing_state => "WA",
                            :mailing_country => "USA",
                            :mailing_zip => "98102",
                            :phone => "123-456-7890",
                            :bio => "My bio")

    submission = DjSubmission.create!(:artist => artist)

    # Full text match
    assert_equal [submission], DjSubmission.search(artist.first_name)

    # Partial text match
    assert_equal [submission], DjSubmission.search(artist.first_name[1..3])
  end
end

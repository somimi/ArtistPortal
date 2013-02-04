require 'test_helper'

class InstallationSubmissionTest < ActiveSupport::TestCase
  def test_valid
    submission = InstallationSubmission.new( :title => "My Title",
                                             :artist => artists(:one))

    assert submission.valid?
  end

  def test_search_title
    assert_equal([installation_submissions(:one)],
                 InstallationSubmission.search("Installation One"))

    assert_equal([installation_submissions(:one)],
                 InstallationSubmission.search("One"))
  end

  def test_search_first_name
    assert_equal([installation_submissions(:two)],
                 InstallationSubmission.search("ArtistTwoFirst"))

    assert_equal([installation_submissions(:two)],
                 InstallationSubmission.search("ArtistTwo"))
  end

  def test_search_default
    assert_equal InstallationSubmission.all.sort, InstallationSubmission.search.sort
  end
end

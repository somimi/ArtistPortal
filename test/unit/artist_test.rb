require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  def test_should_be_valid
    new_artist = Artist.new(:first_name => "Frank",
                            :last_name => "Smith",
                            :phone => "206-555-1212",
                            :mailing_address_line1 => "123 Fake Street",
                            :mailing_city => "Seattle",
                            :mailing_state => "WA",
                            :mailing_country => "USA",
                            :mailing_zip => "98102",
                            :bio => "My Bio",
                            :email_confirmation => "test@example.com",
                            :email => "test@example.com" )

    assert new_artist.valid?
  end

  def test_north_america_true
    mexico = Artist.new(:mailing_country => "Mexico")
    canada = Artist.new(:mailing_country => "Canada")
    usa = Artist.new(:mailing_country => "United States")

    assert mexico.north_america?
    assert canada.north_america?
    assert usa.north_america?
  end

  def test_north_america_false
    germany = Artist.new(:mailing_country => "Germany")

    assert !germany.north_america?
  end

  def test_update_email_requires_confirmation
    artist = artists(:one)
    artist.email = "email@example.com"
    assert !artist.valid?

    artist.email_confirmation = "email@example.com"
    assert artist.valid?
  end

  def test_update_without_email_does_not_require_confirmation
    artist = artists(:one)
    artist.first_name = "New First Name"
    assert artist.valid?
  end

  def test_search_without_params
    artists = Artist.search(false)
    assert_equal Artist.all.sort, artists.sort
  end

  def test_search_with_first_name
    artists = Artist.search("ArtistOneFirst")
    assert_equal [artists(:one)], artists
  end

  def test_search_with_last_name
    artists = Artist.search("ArtistOneLast")
    assert_equal [artists(:one)], artists
  end

  def test_search_with_last_name
    artists = Artist.search("ArtistTwoLast")
    assert_equal [artists(:two)], artists
  end

  def test_search_with_email
    artists = Artist.search("artist_one@example.com")
    assert_equal [artists(:one)], artists
  end
end

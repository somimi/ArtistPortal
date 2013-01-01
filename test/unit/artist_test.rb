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
end

require 'test_helper'

class FilmSubmissionTest < ActiveSupport::TestCase
  def test_validations
    film_submission = FilmSubmission.new()

    assert !film_submission.valid?
    assert film_submission.errors.include?(:title)
    assert film_submission.errors.include?(:duration)

    film_submission.title    = "New film Submission",
    film_submission.duration = "3 minutes"

    assert film_submission.valid?
  end

  def test_can_have_an_artist
    film_submission = FilmSubmission.new(:artist => artists(:one))

    assert_equal artists(:one), film_submission.artist
  end

  def test_search_with_no_artist
    title = "TestSearchWithNoArtist"

    film_submission = FilmSubmission.create!( :title    => title,
                                              :duration => "3 minutes")

    assert_equal [], FilmSubmission.search(title)
  end

  def test_search_by_title
    title = "TestSearchByTitle"

    film_submission = FilmSubmission.create!( :title    => title,
                                              :duration => "3 minutes",
                                              :artist   => artists(:one))

    # Full text search
    assert_equal [film_submission], FilmSubmission.search(title)

    # Partial text search
    assert_equal [film_submission], FilmSubmission.search(title[1..3])
  end

  def test_search_by_artist_first_name
    artist = Artist.create!(:first_name            => "NewArtist",
                            :last_name             => "LastName",
                            :email                 => "test@example.com",
                            :email_confirmation    => "test@example.com",
                            :mailing_address_line1 => "123 Fake Street",
                            :mailing_city          => "Seattle",
                            :mailing_state         => "WA",
                            :mailing_country       => "USA",
                            :mailing_zip           => "98102",
                            :phone                 => "123-456-7890",
                            :bio                   => "My bio")

    title = "TestSearchByArtistFirstName"
    submission = FilmSubmission.create!(:title    => title,
                                        :duration => "30",
                                        :artist   => artist)

    # Full text search
    assert_equal [submission], FilmSubmission.search(artist.first_name)

    # Partial text search
    assert_equal [submission], FilmSubmission.search(artist.first_name[1..3])
  end

  def test_search_no_params
    assert_equal FilmSubmission.all.sort, FilmSubmission.search(nil).sort
  end
end

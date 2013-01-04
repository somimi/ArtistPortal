require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_validation_valid
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    assert user.valid?
  end

  def test_default_role_is_artist
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    assert_equal "artist", user.role
  end

  def test_is_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "admin"
    assert user.is_admin?

    user.role = "artist"
    assert !user.is_admin?
  end

  def test_is_juror
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "juror"
    assert user.is_juror?

    user.role = "artist"
    assert !user.is_juror?
  end

  def test_is_handler
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "handler"
    assert user.is_handler?

    user.role = "artist"
    assert !user.is_handler?
  end

  def test_is_artist
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "artist"
    assert user.is_artist?

    user.role = "handler"
    assert !user.is_artist?
  end

  def test_is_film_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "film admin"
    assert user.is_film_admin?

    user.role = "artist"
    assert !user.is_film_admin?
  end

  def test_is_literary_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "literary admin"
    assert user.is_literary_admin?

    user.role = "artist"
    assert !user.is_literary_admin?
  end

  def test_is_performance_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "performance admin"
    assert user.is_performance_admin?

    user.role = "artist"
    assert !user.is_performance_admin?
  end

  def test_is_installation_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "installation admin"
    assert user.is_installation_admin?

    user.role = "artist"
    assert !user.is_installation_admin?
  end

  def test_is_invited
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "invited artist"
    assert user.is_invited?

    user.role = "artist"
    assert !user.is_invited?
  end

  def test_is_store_admin
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "store admin"
    assert user.is_store_admin?

    user.role = "artist"
    assert !user.is_store_admin?
  end

  def test_is_art_guide
    user = User.new(:email => "test@exmaple.com",
                    :password => "testtesttest")

    user.role = "art guide"
    assert user.is_art_guide?

    user.role = "artist"
    assert !user.is_art_guide?
  end

end

require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  # Helpers
  def login_as_admin
    sign_in :user, users(:admin)
  end


  # Index
  def test_index_redirects_if_not_logged_in
    get :index

    assert_redirected_to new_user_session_path
  end

  def test_index__logged_in
    login_as_admin

    get :index

    assert_response :success
    assert_template 'index'
  end

  def test_index_shows_all_artists
    sign_in :user, users(:handler)

    get :index

    assert_equal Artist.all.sort, assigns(:artists).sort
    Artist.all.each do |artist|
      assert_match artist_path(artist), response.body
      assert_match artist.first_name, response.body
      assert_match artist.last_name, response.body
      assert_match artist.professional_name, response.body
      assert_match artist.id.to_s, response.body
      assert_no_match /#{artist.bio}/, response.body
    end
  end

  def test_index_bio_column_shows_for_admins
    login_as_admin

    get :index

    assert_equal Artist.all.sort, assigns(:artists).sort
    Artist.all.each do |artist|
      assert_match artist_path(artist), response.body
      assert_match artist.first_name, response.body
      assert_match artist.last_name, response.body
      assert_match artist.professional_name, response.body
      assert_match artist.id.to_s, response.body
      assert_match artist.bio, response.body
    end
  end


  def test_show
    login_as_admin
    get :show, :id => Artist.first
    assert_template 'show'
  end

  def test_new
    login_as_admin
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    login_as_admin
    Artist.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    login_as_admin
    Artist.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_path
  end

  def test_edit
    login_as_admin
    get :edit, :id => Artist.first
    assert_template 'edit'
  end

  # Update is currently not validating so this test is invalid
  def test_update_invalid
    login_as_admin
    Artist.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Artist.first
    assert_redirected_to artist_url(assigns(:artist))
  end

  def test_update_valid
    login_as_admin
    Artist.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Artist.first
    assert_redirected_to artist_url(assigns(:artist))
  end

  def test_destroy
    login_as_admin
    artist = Artist.first
    delete :destroy, :id => artist
    assert_redirected_to artists_url
    assert !Artist.exists?(artist.id)
  end
end

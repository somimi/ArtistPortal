require 'test_helper'

class StoreSubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:one)
  end

  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => StoreSubmission.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    StoreSubmission.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    StoreSubmission.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to store_submissions_path
  end

  def test_edit
    get :edit, :id => StoreSubmission.first
    assert_template 'edit'
  end

  def test_update_invalid
    StoreSubmission.any_instance.stubs(:valid?).returns(false)
    put :update, :id => StoreSubmission.first
    assert_template 'edit'
  end

  def test_update_valid
    StoreSubmission.any_instance.stubs(:valid?).returns(true)
    put :update, :id => StoreSubmission.first
    assert_redirected_to store_submission_url(assigns(:store_submission))
  end

  def test_destroy
    store_submission = StoreSubmission.first
    delete :destroy, :id => store_submission
    assert_redirected_to store_submissions_url
    assert !StoreSubmission.exists?(store_submission.id)
  end
end

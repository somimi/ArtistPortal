require 'test_helper'

class VisualSubmissionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => VisualSubmission.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    VisualSubmission.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    VisualSubmission.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to visual_submission_url(assigns(:visual_submission))
  end

  def test_edit
    get :edit, :id => VisualSubmission.first
    assert_template 'edit'
  end

  def test_update_invalid
    VisualSubmission.any_instance.stubs(:valid?).returns(false)
    put :update, :id => VisualSubmission.first
    assert_template 'edit'
  end

  def test_update_valid
    VisualSubmission.any_instance.stubs(:valid?).returns(true)
    put :update, :id => VisualSubmission.first
    assert_redirected_to visual_submission_url(assigns(:visual_submission))
  end

  def test_destroy
    visual_submission = VisualSubmission.first
    delete :destroy, :id => visual_submission
    assert_redirected_to visual_submissions_url
    assert !VisualSubmission.exists?(visual_submission.id)
  end
end

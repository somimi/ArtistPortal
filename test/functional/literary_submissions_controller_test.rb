require 'test_helper'

class LiterarySubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @literary_submission = literary_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:literary_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create literary_submission" do
    assert_difference('LiterarySubmission.count') do
      post :create, literary_submission: @literary_submission.attributes
    end

    assert_redirected_to literary_submissions_path
  end

  test "should show literary_submission" do
    get :show, id: @literary_submission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @literary_submission.to_param
    assert_response :success
  end

  test "should update literary_submission" do
    put :update, id: @literary_submission.to_param, literary_submission: @literary_submission.attributes
    assert_redirected_to literary_submissions_path
  end

  test "should destroy literary_submission" do
    assert_difference('LiterarySubmission.count', -1) do
      delete :destroy, id: @literary_submission.to_param
    end

    assert_redirected_to literary_submissions_path
  end
end

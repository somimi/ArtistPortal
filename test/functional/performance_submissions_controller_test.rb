require 'test_helper'

class PerformanceSubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @performance_submission = performance_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance_submission" do
    assert_difference('PerformanceSubmission.count') do
      post :create, performance_submission: @performance_submission.attributes
    end

    assert_redirected_to performance_submissions_path
  end

  test "should show performance_submission" do
    get :show, id: @performance_submission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance_submission.to_param
    assert_response :success
  end

  test "should update performance_submission" do
    put :update, id: @performance_submission.to_param, performance_submission: @performance_submission.attributes
    assert_redirected_to performance_submissions_path
  end

  test "should destroy performance_submission" do
    assert_difference('PerformanceSubmission.count', -1) do
      delete :destroy, id: @performance_submission.to_param
    end

    assert_redirected_to performance_submissions_path
  end
end

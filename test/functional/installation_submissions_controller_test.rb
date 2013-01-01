require 'test_helper'

class InstallationSubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @installation_submission = installation_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:installation_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create installation_submission" do
    assert_difference('InstallationSubmission.count') do
      post :create, installation_submission: @installation_submission.attributes
    end

    assert_redirected_to installation_submissions_path
  end

  test "should show installation_submission" do
    get :show, id: @installation_submission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @installation_submission.to_param
    assert_response :success
  end

  test "should update installation_submission" do
    put :update, id: @installation_submission.to_param, installation_submission: @installation_submission.attributes
    assert_redirected_to installation_submissions_path
  end

  test "should destroy installation_submission" do
    assert_difference('InstallationSubmission.count', -1) do
      delete :destroy, id: @installation_submission.to_param
    end

    assert_redirected_to installation_submissions_path
  end
end

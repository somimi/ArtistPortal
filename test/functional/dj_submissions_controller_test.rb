require 'test_helper'

class DjSubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @dj_submission = dj_submissions(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:dj_submissions)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create dj_submission" do
  #   assert_difference('DjSubmission.count') do
  #     post :create, dj_submission: @dj_submission.attributes
  #   end

  #   assert_redirected_to dj_submission_path(assigns(:dj_submission))
  # end

  # test "should show dj_submission" do
  #   get :show, id: @dj_submission.to_param
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @dj_submission.to_param
  #   assert_response :success
  # end

  # test "should update dj_submission" do
  #   put :update, id: @dj_submission.to_param, dj_submission: @dj_submission.attributes
  #   assert_redirected_to dj_submission_path(assigns(:dj_submission))
  # end

  # test "should destroy dj_submission" do
  #   assert_difference('DjSubmission.count', -1) do
  #     delete :destroy, id: @dj_submission.to_param
  #   end

  #   assert_redirected_to dj_submissions_path
  # end
end

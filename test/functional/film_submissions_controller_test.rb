require 'test_helper'

class FilmSubmissionsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @film_submission = film_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:film_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create film_submission" do
    assert_difference('FilmSubmission.count') do
      post :create, film_submission: @film_submission.attributes
    end

    assert_redirected_to film_submissions_path
  end

  test "should show film_submission" do
    get :show, id: @film_submission.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @film_submission.to_param
    assert_response :success
  end

  test "should update film_submission" do
    put :update, id: @film_submission.to_param, film_submission: @film_submission.attributes
    assert_redirected_to film_submissions_path
  end

  test "should destroy film_submission" do
    assert_difference('FilmSubmission.count', -1) do
      delete :destroy, id: @film_submission.to_param
    end

    assert_redirected_to film_submissions_path
  end
end

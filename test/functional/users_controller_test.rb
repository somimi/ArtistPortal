require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:one).id
    assert_response :success
  end

  # TODO this should probably be a put or a post, not a get
  test "should get update" do
    get :update, :id => users(:one).id, :user => users(:one).attributes
    assert_redirected_to users_path
  end

  test "should get show" do
    get :show, :id => users(:one).id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => users(:one).id
    assert_redirected_to root_path
  end
end

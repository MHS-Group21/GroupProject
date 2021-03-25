require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # Automatically logs the user in for all the tests
  # setup do
  #   sign_in users(:one)
  # end

# Tests for volunteer action
  test "should get volunteer page" do
    sign_in users(:one)
    get volunteer_path
    assert_response :success
  end
  
  test "redirect from volunteer_path if not logged in" do
    sign_in users(:one)
    # Signs out the user for this test
    sign_out :user
    get volunteer_path
    assert_response :redirect
  end

  test "redirect if not volunteer" do
    sign_in users(:one)
    # Signs out the user for this test
    sign_out :user
    sign_in users(:two)
    get volunteer_path
    assert_response :redirect
  end

  test "Redirect to root from home_index_path, if not logged in" do
    sign_in users(:one)
    # Signs out the user for this test
    sign_out :user
    get home_index_path
    assert_response :redirect
  end

  test "should get admin page" do
    sign_in users(:three)
    get admin_path
    assert_response :success
  end

  test "redirect from admin_path if not logged in" do
    sign_in users(:three)
    # Signs out the user for this test
    sign_out :user
    get admin_path
    assert_response :redirect
  end

  test "redirect if not admin" do
    sign_in users(:three)
    # Signs out the user for this test
    sign_out :user
    sign_in users(:two)
    get admin_path
    assert_response :redirect
  end

end

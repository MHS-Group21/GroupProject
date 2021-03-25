require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::IntegrationHelpers
  # Line above is not needed here, it has to be in the test helper

  # Automatically logs the user in for all the tests
  setup do
    sign_in users(:one)
  end

# Tests for volunteer action
  test "should get volunteer page" do
    get volunteer_path
    assert_response :success
  end
  
  test "redirect if not logged in" do
    # Signs out the user for this test
    sign_out :user
    get volunteer_path
    assert_response :redirect
  end

  test "redirect if not user" do
    # Signs out the user for this test
    sign_out :user
    sign_in users(:two)
    get volunteer_path
    assert_response :redirect
  end

end

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

# Tests for volunteer action
  test "should get volunteer page" do
    sign_in users(:one)
    get volunteer_path
    assert_response :success
  end
  
  test "redirect from volunteer_path if not logged in" do
    get volunteer_path
    assert_response :redirect
  end

  test "redirect if not volunteer" do
    sign_in users(:two)
    get volunteer_path
    assert_response :redirect
  end

  test "Redirect to root from home_index_path, if not logged in" do
    get home_index_path
    assert_response :redirect
  end

  # Tests for admin page
  test "should get admin page" do
    sign_in users(:three)
    get admin_path
    assert_response :success
  end

  test "redirect from admin_path if not logged in" do
    get admin_path
    assert_response :redirect
  end

  test "redirect if not admin" do
    sign_in users(:two)
    get admin_path
    assert_response :redirect
  end

  # Tests for Twitter API
  test "should get Twitter page (Not logged in)" do
    get twitter_path
    assert_response :success
    assert_select "h2", text: "Tweets We Picked For You"
    assert_select "title", text: "MHS - Tweets For You"
  end

  test "should get Twitter page (Logged in)" do
    sign_in users(:two)
    get twitter_path
    assert_response :success    
  end
end

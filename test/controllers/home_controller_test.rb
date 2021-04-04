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

  test "should get contact" do
    get contact_url
    assert_response :success
  end

  test "should post request contact" do
    post request_contact_url, params:{name: "Matthew", email: "matthew@me.com", message: "Hello"}
      assert_response :redirect
      assert_nil flash[:alert]
      assert_not_empty flash[:notice]
  end

end

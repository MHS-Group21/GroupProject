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
    users(:two).user!
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

  test "redirect from questionnaire if not volunteer" do
    sign_in users(:two)
    get questionnaire_path
    assert_response :redirect
  end

  test "should get questionnaire page" do
    sign_in users(:one)
    get questionnaire_path
    assert_response :success
  end

  test "should get redirect beacuse training is already completed" do
    sign_in users(:four)
    get questionnaire_path
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

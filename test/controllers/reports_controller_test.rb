require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(users(:two))
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should create discussion report" do
    assert_difference('DiscussionReport.count') do
      post reports_url, xhr: true, params: { discussion_id: discussions(:three).id}
    end
  end

  test "should create reply report" do
    assert_difference('ReplyReport.count') do
      post reports_url, xhr: true, params: { reply_id: replies(:three).id}
    end
  end

  test "should show discussion report" do
    get "/reports/discussion", params: {id: discussion_reports(:one).id}
  end

  test "should show reply report" do
    get "/reports/reply", params: {id: reply_reports(:one).id}
  end

  test "should update report" do

  end
end

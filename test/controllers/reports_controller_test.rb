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

  test "should update discussion report" do
    patch reports_path, params: {discussion_id: discussions(:one).id, review_status: :reviewed, admin_comment: "test"}
    assert discussion_reports(:one).reviewed?
    assert discussion_reports(:one).admin_comment == "test"
  end

  test "should update reply report" do
    patch reports_path, params: {reply_id: replies(:one).id, review_status: :removed, admin_comment: "test"}
    assert reply_reports(:one).removed?
    assert reply_reports(:one).admin_comment == "test"
  end
end

require 'test_helper'

class DiscussionReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Does review status enum work" do
    assert discussion_reports(:one).unreviewed?
    assert discussion_reports(:two).unreviewed_hidden?
  end
end

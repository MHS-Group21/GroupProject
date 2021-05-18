require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  test "can't save discussion without channel" do
    discussion = Discussion.new({user: users(:one), title: "Title", content: "this is a discussion"})
    discussion.save
    refute discussion.valid?
  end

  test "can't save discussion without user" do
    discussion = Discussion.new({channel: channels(:one), title: "Title", content: "this is a discussion"})
    discussion.save
    refute discussion.valid?
  end

  test "can't save discussion without title" do
    discussion = Discussion.new({user: users(:one), channel: channels(:one), content: "this is a discussion"})
    discussion.save
    refute discussion.valid?
  end

  test "can't save discussion without content" do
    discussion = Discussion.new({user: users(:one), channel: channels(:one), title: "Title"})
    discussion.save
    refute discussion.valid?
  end

  test "can't save discussion with title that is too small" do
    discussion = Discussion.new({user: users(:one), channel: channels(:one), title: "aaa", content: "this is a discussion"})
    discussion.save
    refute discussion.valid?
  end

  test "can't save discussion with title that is too big" do
    discussion = Discussion.new({user: users(:one), channel: channels(:one), title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", content: "this is a discussion"})
    discussion.save
    refute discussion.valid?
  end

  test "can save valid discussion" do
    discussion = Discussion.new({user: users(:one), channel: channels(:one), title: "title", content: "this is a discussion"})
    discussion.save
    assert discussion.valid?
  end
end

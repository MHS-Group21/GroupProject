require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "can't save reply without text" do
    reply = Reply.new({discussion: discussions(:one), user: users(:one)})
    reply.save
    refute reply.valid?
  end

  test "can't save reply without user" do
    reply = Reply.new({discussion: discussions(:one), reply_text: "reply text"})
    reply.save
    refute reply.valid?
  end

  test "can save valid reply" do
    reply = Reply.new({discussion: discussions(:one), user: users(:one), reply_text: "reply text"})
    reply.save
    assert reply.valid?
  end
end
